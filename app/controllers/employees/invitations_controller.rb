class Employees::InvitationsController < Devise::InvitationsController
    before_action :configure_permitted_parameters

    protected
  
    # Permit the new params here.
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:invite, keys: [:name, :division_id, :master_role_id,:username])
    end
  
  

  end