class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :person_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
