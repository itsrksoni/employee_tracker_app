class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable
  devise :invitable, :database_authenticatable, 
         :recoverable, :rememberable, :validatable,  :registerable

  # validations
  validates :name, length: { minimum: 3}#, presence: true
  validates :username, length: { minimum: 5, maximum: 10}, presence: true, uniqueness: true
  

  # associated tables
  belongs_to :master_role
  belongs_to :division
  has_many :project_assignments
  has_many :projects, through: :project_assignments
  has_one_attached :image




end
