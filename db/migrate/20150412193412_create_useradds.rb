class CreateUseradds < ActiveRecord::Migration
  def change
    create_table :useradds do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
