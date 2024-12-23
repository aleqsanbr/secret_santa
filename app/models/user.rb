class User < ApplicationRecord
  has_secure_password

  # Связь через GroupMember
  has_many :group_members, class_name: "GroupMember", foreign_key: :user_id
  has_many :groups, through: :group_members

  # Список желаний пользователя
  has_many :wishlist_items

  # Приглашения, созданные пользователем
  has_many :invitation_links, foreign_key: :created_by, class_name: "InvitationLink"
end
