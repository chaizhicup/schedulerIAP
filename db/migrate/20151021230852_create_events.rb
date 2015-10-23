class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :max_students
      t.boolean :for_student
      t.date :event_date
      t.time :start_time
      t.time :end_time
      t.integer :timeslot_duration
    end
  end
end
