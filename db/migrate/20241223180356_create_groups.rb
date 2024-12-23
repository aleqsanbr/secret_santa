class CreateGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.string :description
      t.string :owner_id, null: false, index: true
      t.string :invitation_code, index: true
      t.boolean :is_active, default: false
      t.boolean :distribution_started, default: false
      t.timestamps
    end
  end
end
