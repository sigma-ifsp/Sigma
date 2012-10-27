class CreateClientBalances < ActiveRecord::Migration
  def change
    create_table :client_balances do |t|
      t.references :client
      t.references :promotion
      t.integer :balance

      t.timestamps
    end
    add_index :client_balances, :client_id
    add_index :client_balances, :promotion_id
  end
end
