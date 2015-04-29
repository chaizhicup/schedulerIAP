class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :contact_person
      t.string :contact_email
      t.string :sponsor_level
      t.string :citizenship
      t.string :job_type
      t.string :student_level
      t.string :rep_1
      t.string :rep_2
      t.string :rep_3
      t.string :rep_4
      t.string :rep_5
      t.string :rep_6
      t.integer :intvw_1_rep_no
      t.integer :intvw_2_rep_no
      t.integer :clinic_1_rep_no
      t.integer :clinic_2_rep_no
      t.integer :clinic_3_rep_no

      t.timestamps null: false
    end
  end
end
