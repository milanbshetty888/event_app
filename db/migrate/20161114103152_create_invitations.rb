class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :inviter_id
      t.string :invitee_id
      t.string :event_id

      t.timestamps null: false
    end
  end
end
