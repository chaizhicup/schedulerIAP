class AddLunchRepNoToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :lunch_rep_no, :integer
  end
end
