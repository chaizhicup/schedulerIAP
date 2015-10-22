class RemoveColumsFromTimeslots < ActiveRecord::Migration
  def change
    remove_column :timeslots, :att_date, :string
    remove_column :timeslots, :slot, :string
    remove_column :timeslots, :section, :string
    remove_column :timeslots, :stunum, :integer
  end
end
