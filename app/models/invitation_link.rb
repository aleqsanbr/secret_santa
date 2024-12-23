class InvitationLink < ApplicationRecord
  # Связь с группой
  belongs_to :group

  # Связь с пользователем, создавшим приглашение
  belongs_to :creator, class_name: "User", foreign_key: :created_by
end
