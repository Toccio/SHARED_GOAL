class CreateInstruments < ActiveRecord::Migration[6.1]
  def change
    create_table :instruments do |t|
      t.string :instrument
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
