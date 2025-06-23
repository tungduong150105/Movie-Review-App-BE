class CreateMovieinfors < ActiveRecord::Migration[7.0]
  def change
    create_table :movieinfors do |t|
      t.string :type_name
      t.string :_id
      t.string :name
      t.string :img_url
      t.string :release_day

      t.timestamps
    end
  end
end
