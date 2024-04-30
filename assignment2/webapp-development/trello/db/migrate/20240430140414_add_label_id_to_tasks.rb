class AddLabelIdToTasks < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :label, null: true, foreign_key: true
  end
end
