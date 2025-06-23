class AddUniqueToMovieinfor < ActiveRecord::Migration[7.0]
  def change
    add_index :movieinfors, %i[type_name _id], unique: true
  end
end
