class WishlistItem < ApplicationRecord
  # Связь с пользователем
  belongs_to :user

  # Связь с группой
  belongs_to :group
end
