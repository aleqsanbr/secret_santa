class GroupMember < ApplicationRecord
  belongs_to :group
  belongs_to :user
  belongs_to :recipient, class_name: "User", optional: true
end
