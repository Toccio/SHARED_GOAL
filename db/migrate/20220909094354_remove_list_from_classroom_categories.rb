class RemoveListFromClassroomCategories < ActiveRecord::Migration[6.1]
  def change
    remove_reference :classroom_categories, :list, null: false, foreign_key: true
  end
end
