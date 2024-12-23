class User < ApplicationRecord
  has_secure_password
  has_many :group_members, class_name: "GroupMember", foreign_key: :user_id
  has_many :groups, through: :group_members
  has_many :wishlist_items
  has_many :invitation_links, foreign_key: :created_by, class_name: "InvitationLink"
end
