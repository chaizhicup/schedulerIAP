class CreateCompanyevents < ActiveRecord::Migration
  def change
    create_table :companyevents do |t|
      t.integer :company_id
      t.integer :event_id
      t.integer :representatives
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
