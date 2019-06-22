class Task < ApplicationRecord
    belongs_to :project
    belongs_to :users, through:  :project
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    validates :project_id, presence: true
    validates :content, presence: true, length: { maximum: 282 }
end
