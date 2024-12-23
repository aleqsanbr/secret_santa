class Group < ApplicationRecord
  validates :name, presence: true
  validates :owner_id, presence: true
  validates :invitation_code, presence: true

  before_create :generate_invitation_code, if: :invitation_code_blank?

  belongs_to :owner, class_name: "User", foreign_key: :owner_id

  # Указываем явно класс GroupMember
  has_many :group_members, class_name: "GroupMember", dependent: :destroy
  has_many :users, through: :group_members

  has_many :wishlist_items, dependent: :destroy
  has_many :invitation_links, dependent: :destroy

  private

  def generate_invitation_code
    self.invitation_code = SecureRandom.hex(10)
  end

  def invitation_code_blank?
    invitation_code.blank?
  end
end
