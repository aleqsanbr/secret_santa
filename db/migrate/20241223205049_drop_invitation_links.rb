class DropInvitationLinks < ActiveRecord::Migration[8.0]
  def change
    drop_table :invitation_links
  end
end
