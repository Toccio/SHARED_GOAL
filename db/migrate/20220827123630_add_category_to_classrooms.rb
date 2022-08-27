class AddCategoryToClassrooms < ActiveRecord::Migration[6.1]
  def change
    add_column :classrooms, :category, :string
  end
end
