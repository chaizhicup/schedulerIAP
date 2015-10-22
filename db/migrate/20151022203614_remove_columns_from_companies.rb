class RemoveColumnsFromCompanies < ActiveRecord::Migration
  def change
    remove_column :companies, :intvw_1_rep_no, :integer
    remove_column :companies, :intvw_2_rep_no, :integer
    remove_column :companies, :clinic_1_rep_no, :integer
    remove_column :companies, :clinic_2_rep_no, :integer
    remove_column :companies, :clinic_3_rep_no, :integer
    remove_column :companies, :lunch_rep_no, :integer
  end
end
