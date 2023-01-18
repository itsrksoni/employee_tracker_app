class Division < ApplicationRecord
    has_many :employees, dependent: :nullify

    validates :name, length: { minimum: 2, maximum: 20}, presence: true, uniqueness: true



end
