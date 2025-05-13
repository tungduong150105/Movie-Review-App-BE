class CreateWatchlists < ActiveRecord::Migration[7.0]
  def change
    create_table :watchlists do |t|
      t.string :movie_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
