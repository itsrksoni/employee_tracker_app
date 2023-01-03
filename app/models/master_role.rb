class MasterRole < ApplicationRecord
    has_many :employees

    validates :name, length: { minimum: 2, maximum: 15}, presence: true, uniqueness: true


end
