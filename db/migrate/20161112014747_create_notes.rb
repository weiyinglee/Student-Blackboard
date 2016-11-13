class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|

      t.string :user
      t.string :month
      t.string :day
      t.string :content

      t.timestamps
    end
  end
end
