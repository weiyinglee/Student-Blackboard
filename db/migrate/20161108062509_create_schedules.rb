class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    #drop_table :schedules
    create_table :schedules do |t|

      t.string :user
      t.string :professor
      t.string :classname
      t.string :classroom
      t.string :day
      t.string :hour
      t.string :minute
      t.string :hour_end
      t.string :minute_end

      t.timestamps
    end
  end
end
