class CreateUserProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :user_projects do |t|
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
    add_index :user_projects, :project_id
    add_index :user_projects, :user_id
    add_index :user_projects, [:project_id, :user_id], unique: true
  end
end
