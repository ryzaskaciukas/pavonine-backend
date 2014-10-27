class CreateGymSessions < ActiveRecord::Migration
  def change
    create_table :gym_sessions do |t|
      t.date :day
      t.float :squat
      t.float :bench
      t.float :press
      t.float :powerclean
      t.float :deadlift

      t.timestamps
    end
  end
end
