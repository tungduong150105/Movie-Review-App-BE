class CreateRecents < ActiveRecord::Migration[7.0]
  def change
    create_table :recents do |t|
      t.string :type_name
      t.string :_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
