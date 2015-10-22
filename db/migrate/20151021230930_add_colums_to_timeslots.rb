class AddColumsToTimeslots < ActiveRecord::Migration
  def change
    add_column :timeslots, :start_time, :time
    add_column :timeslots, :end_time, :time
  end
end
