class AddOldbIdxToGames < ActiveRecord::Migration
  def change
    add_column :games, :oldb_idx, :integer
    add_index :games, :oldb_idx
  end
end
