class CreateProjectsUsersJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :projects, :users do |t|
      t.references :project
      t.references :user
    end
  end
end
