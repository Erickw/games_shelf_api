class AddGameToLists < ActiveRecord::Migration[7.2]
  def change
    add_column :lists, :game, :string
  end
end
