class RemoveColumnTaskIdFromProjects < ActiveRecord::Migration[5.1]
  def change
    remove_column :projects, :task_id
  end
end
