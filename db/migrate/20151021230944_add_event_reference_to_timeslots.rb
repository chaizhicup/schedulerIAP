class AddEventReferenceToTimeslots < ActiveRecord::Migration
  def change
    add_reference :timeslots, :event, index: true, foreign_key: true
  end
end
