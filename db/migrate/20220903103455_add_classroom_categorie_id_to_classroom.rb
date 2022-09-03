class AddClassroomCategorieIdToClassroom < ActiveRecord::Migration[6.1]
  def change
    add_reference :classrooms, :classroom_category, null: false, foreign_key: true
  end
end
