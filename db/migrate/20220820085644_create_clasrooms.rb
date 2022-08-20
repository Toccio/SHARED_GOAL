class CreateClasrooms < ActiveRecord::Migration[6.1]
  def change
    create_table :clasrooms do |t|
      t.string :name
      t.text :description
      t.string :start_date
      t.string :end_date
      t.string :address
      t.integer :max_number_of_partecipants
      t.string :language
      t.string :level
      t.integer :time

      t.timestamps
    end
  end
end
