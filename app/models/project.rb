class Project < ApplicationRecord
    has_many :project_assignments
    has_many :employees, through: :project_assignments

    validates :name, length: { minimum: 2, maximum: 15}, presence: true
end
