class CreateJoinTableStudentsTimeslots < ActiveRecord::Migration
  def change
    create_join_table :students, :timeslots do |t|
      # t.index [:student_id, :timeslot_id]
      # t.index [:timeslot_id, :student_id]
    end
  end
end
