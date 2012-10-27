class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.references :promotion
      t.references :client
      t.string :observation

      t.timestamps
    end
    add_index :exchanges, :promotion_id
    add_index :exchanges, :client_id
  end
end
