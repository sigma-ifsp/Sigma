class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.references :company
      t.references :user

      t.timestamps
    end
    add_index :employees, :company_id
    add_index :employees, :user_id
  end
end
