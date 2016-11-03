class CreateUsers < ActiveRecord::Migration[5.0]
  def change
  	drop_table :users
    create_table :users do |t|
      t.string :account
      t.string :password_digest

      t.timestamps
    end
  end
end
