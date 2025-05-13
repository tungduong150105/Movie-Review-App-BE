class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :forum, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
