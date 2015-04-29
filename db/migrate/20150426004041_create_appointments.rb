class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :section
      t.string :time_slot
      t.string :company
      t.string :student
      t.string :UIN

      t.timestamps null: false
    end
  end
end
