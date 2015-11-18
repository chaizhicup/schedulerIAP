class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :max_students
      t.boolean :for_student
      t.boolean :for_company
      t.date :event_date
      t.datetime :start_time
      t.datetime :end_time
      t.integer :timeslot_duration
    end
  end
end
