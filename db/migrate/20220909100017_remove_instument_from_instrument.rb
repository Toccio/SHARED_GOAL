class RemoveInstumentFromInstrument < ActiveRecord::Migration[6.1]
  def change
    remove_column :instruments, :instrument, :string
  end
end
