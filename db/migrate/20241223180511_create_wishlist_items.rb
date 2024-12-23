class CreateWishlistItems < ActiveRecord::Migration[8.0]
  def change
    create_table :wishlist_items do |t|
      t.string :user_id, null: false
      t.string :group_id, null: false
      t.string :title, null: false
      t.string :description
      t.string :url
      t.decimal :price, precision: 10, scale: 2
      t.integer :priority, default: 0
      t.timestamps
    end
  end
end
