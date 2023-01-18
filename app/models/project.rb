class Project < ApplicationRecord
    has_many :project_assignments
    has_many :employees, through: :project_assignments, dependent: :destroy

    validates :name, length: { minimum: 2}, presence: true
end
