class RenameTypeColoumnOfRating < ActiveRecord::Migration[7.0]
  def change
    rename_column :ratings, :type, :type_name
  end
end
