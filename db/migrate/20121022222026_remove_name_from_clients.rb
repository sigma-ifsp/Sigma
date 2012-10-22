class RemoveNameFromClients < ActiveRecord::Migration
  def up
    remove_column(:clients, :name)
  end

  def down
    add_column(:clients, :name, :string)
  end
end
