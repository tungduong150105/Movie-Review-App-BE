class AddColumnAndRenameMoiveIdOfWatchlist < ActiveRecord::Migration[7.0]
  def change
    add_column :watchlists, :type_name, :string
    rename_column :watchlists, :movie_id, :_id
  end
end
