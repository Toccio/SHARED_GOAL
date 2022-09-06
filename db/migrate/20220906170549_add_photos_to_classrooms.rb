class AddPhotosToClassrooms < ActiveRecord::Migration[6.1]
  def change
    add_column :classrooms, :photo, :string
  end
end
