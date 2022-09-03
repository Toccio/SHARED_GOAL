class AddClassroomCategoriesIdToClassroom < ActiveRecord::Migration[6.1]
  def change
    add_reference :classrooms, :classroom_categorie, null: false, foreign_key: true
  end
end
