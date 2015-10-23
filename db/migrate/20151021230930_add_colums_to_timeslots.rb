class AddColumsToTimeslots < ActiveRecord::Migration
  def change
    add_column :timeslots, :start_time, :datetime
    add_column :timeslots, :end_time, :datetime
    add_column :timeslots, :stunum, :integer
  end
end
