class AddUniqueToSomeColumns < ActiveRecord::Migration[7.0]
  def change
    add_index :watchlists, %i[type_name _id], unique: true
  end
end
