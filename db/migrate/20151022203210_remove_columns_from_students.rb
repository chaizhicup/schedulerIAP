class RemoveColumnsFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :Mock_1, :string
    remove_column :students, :Mock_2, :string
    remove_column :students, :Resume_1, :string
    remove_column :students, :Resume_2, :string
    remove_column :students, :Resume_3, :string
    remove_column :students, :Lunch, :string
  end
end
