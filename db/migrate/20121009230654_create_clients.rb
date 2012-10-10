class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :cpf
      t.references :user

      t.timestamps
    end
    add_index :clients, :user_id
    add_index :clients, :cpf
  end
end
