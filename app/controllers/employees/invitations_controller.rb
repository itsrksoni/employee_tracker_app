class Employees::InvitationsController < Devise::InvitationsController
    before_action :configure_permitted_parameters
    before_action :authenticate_employee!
  #  before_action :authenticate_employee!
   

    protected
  
    # Permit the new params here.
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:invite, keys: [:name, :division_id, :master_role_id,:username])
    end

    private

   
  

    # def is_hr_manager?
    #     redirect_to root_path unless current_employee.hr_manager
    # end

  
  

  end