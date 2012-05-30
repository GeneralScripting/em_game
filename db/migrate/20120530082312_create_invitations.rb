class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :user_id
      t.string :request_id
      t.string :guest_id
      t.datetime :accepted_at

      t.timestamps
    end
    add_index :invitations, :user_id
    add_index :invitations, :request_id
    add_index :invitations, :guest_id
    add_index :invitations, :accepted_at
  end
end
