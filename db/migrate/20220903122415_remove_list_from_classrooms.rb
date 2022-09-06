class RemoveListFromClassrooms < ActiveRecord::Migration[6.1]
  def change
    remove_reference :classrooms, :list, null: false, foreign_key: true
  end
end
