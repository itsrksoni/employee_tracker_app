class ProjectAssignment < ApplicationRecord
  belongs_to :employee
  belongs_to :project

  validates_uniqueness_of :project_id, :scope => :employee_id

  





end
