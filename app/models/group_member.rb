class GroupMember < ApplicationRecord
  # Связь с группой
  belongs_to :group

  # Связь с пользователем
  belongs_to :user

  # Связь с тем, кому участник делает подарок
  belongs_to :recipient, class_name: "User", optional: true
end
