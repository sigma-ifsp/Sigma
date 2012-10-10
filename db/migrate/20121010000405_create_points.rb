class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.references :client
      t.decimal :value
      t.integer :points
      t.references :promotion
      t.references :company

      t.timestamps
    end
    add_index :points, :client_id
    add_index :points, :promotion_id
    add_index :points, :company_id
  end
end
