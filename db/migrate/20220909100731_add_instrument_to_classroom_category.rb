class AddInstrumentToClassroomCategory < ActiveRecord::Migration[6.1]
  def change
    add_reference :classroom_categories, :instrument, null: false, foreign_key: true
  end
end
