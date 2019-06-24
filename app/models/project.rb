class Project < ApplicationRecord
    has_many :tasks
    has_many :user_projects
    has_many :users, through: :user_projects
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    validates :name, presence: true, length: { maximum: 100 }
end
