class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :type_name
      t.string :_id
      t.string :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
