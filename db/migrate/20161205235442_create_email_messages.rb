class CreateEmailMessages < ActiveRecord::Migration
  def change
    create_table :email_messages do |t|
      t.string :email
      t.string :title
      t.text :header
      t.text :footer

      t.timestamps null: false
    end
  end
end
