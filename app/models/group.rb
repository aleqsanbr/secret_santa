class Group < ApplicationRecord
  validates :name, presence: true
  validates :owner_id, presence: true
  validates :invitation_code, presence: true

  before_create :generate_invitation_code, if: :invitation_code_blank?

  belongs_to :owner, class_name: "User", foreign_key: :owner_id

  has_many :group_members, class_name: "GroupMember", dependent: :destroy
  has_many :users, through: :group_members

  has_many :wishlist_items, dependent: :destroy

  def distribute_santas
    return false if distribution_started?
    return false if group_members.count < 3

    members = group_members.to_a
    receivers = members.shuffle

    while members.zip(receivers).any? { |giver, receiver| giver == receiver }
      receivers.shuffle!
    end

    # todo обернуть в транзакцию

    members.zip(receivers).each do |giver, receiver|
      giver.update(recipient_id: receiver.user_id)
    end

    update(distribution_started: true)

    # end
    true
  rescue => e
    Rails.logger.error "Distribution error: #{e.message}"
    false
  end

  private

  def generate_invitation_code
    self.invitation_code = SecureRandom.hex(10)
  end

  def invitation_code_blank?
    invitation_code.blank?
  end
end
