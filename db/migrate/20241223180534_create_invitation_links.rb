class CreateInvitationLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :invitation_links do |t|
      t.string :group_id, null: false
      t.string :code, null: false, index: { unique: true }
      t.datetime :expires_at
      t.string :created_by, null: false
      t.timestamps
    end
  end
end
