class Project < ApplicationRecord
    has_many :tasks
    has_and_belongs_to_many :users
    default_scope -> { order(created_at: :desc) }
    validates :name, presence: true, length: { maximum: 100 }
end
