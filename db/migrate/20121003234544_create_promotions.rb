class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :name
      t.date :initial_date
      t.date :ending_date
      t.integer :points
      t.decimal :value
      t.references :company
      t.references :user

      t.timestamps
    end
    add_index :promotions, :company_id
    add_index :promotions, :user_id
  end
end
