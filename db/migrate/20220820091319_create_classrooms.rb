class CreateClassrooms < ActiveRecord::Migration[6.1]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.text :description
      t.string :start_date
      t.string :end_date
      t.string :address
      t.integer :max_number_of_partecipants
      t.string :language
      t.string :level
      t.integer :time
      t.references :user, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
