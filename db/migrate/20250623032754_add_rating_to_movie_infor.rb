class AddRatingToMovieInfor < ActiveRecord::Migration[7.0]
  def change
    add_column :movieinfors, :rating, :string
  end
end
