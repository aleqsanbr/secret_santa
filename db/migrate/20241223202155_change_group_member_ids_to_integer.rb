class ChangeGroupMemberIdsToInteger < ActiveRecord::Migration[8.0]
  def change
    change_column :group_members, :group_id, :integer
    change_column :group_members, :user_id, :integer
  end
end
