class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable
  devise :invitable, :database_authenticatable, 
         :recoverable, :rememberable, :validatable,  :registerable

  # validations
  validates :name, length: { minimum: 3}#, presence: true
  validates :username, length: { minimum: 5, maximum: 10}, presence: true, uniqueness: true

  before_create :check_MasterRole
  

  # associated tables
  belongs_to :master_role
  belongs_to :division
  has_many :project_assignments
  has_many :projects, through: :project_assignments, dependent: :destroy
  has_one_attached :image


  def hr_manager

   if self.master_role_id == 1
    value = true
   else 
    value = false
   end
   value
 
  end

  def project_manager

    if self.master_role_id == 2
      value = true
     else 
      value = false
     end
     value

  end
  def check_MasterRole
    if self.master_role_id == 1
      value = true
     else 
      value = puts "you don't have access to create new employee"
     end
     value

  end


end
