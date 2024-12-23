class CreateGroupMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :group_members do |t|
      t.string :group_id, null: false
      t.string :user_id, null: false
      t.string :recipient_id
      t.datetime :joined_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamps
    end
    add_index :group_members, [ :group_id, :user_id ], unique: true
  end
end
