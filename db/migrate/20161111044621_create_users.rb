class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :username
      t.string :email
      t.integer :phoneno
      t.string :role
      t.string :password_digest
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
