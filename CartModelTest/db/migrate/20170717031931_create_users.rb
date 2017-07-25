class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :password_digest
      t.string :name
      t.integer :gender
      t.datetime :birthday
      t.integer :role, default: 0
      t.string :avatar
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
