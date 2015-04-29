class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.string :att_date
      t.string :section
      t.string :slot
      t.integer :stunum

      t.timestamps null: false
    end
  end
end
