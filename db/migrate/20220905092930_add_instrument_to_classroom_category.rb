class AddInstrumentToClassroomCategory < ActiveRecord::Migration[6.1]
  def change
    add_column :classroom_categories, :instrument, :string
  end
end
