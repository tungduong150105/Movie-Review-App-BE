class CreateForums < ActiveRecord::Migration[7.0]
  def change
    create_table :forums do |t|
      t.string :movie_id

      t.timestamps
    end
  end
end
