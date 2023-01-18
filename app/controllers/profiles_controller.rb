class ProfilesController < ApplicationController
    before_action :authenticate_employee!

    def profile
        
    end

    def change_photo
      @employee = current_employee
    end

    def edit_password
        @employee = current_employee
    end

    def update_photo
      @employee = current_employee
      if @employee.update(params.require(:employee).permit(:image))
        redirect_to root_path
      else
        render "change_photo"
      end

    end
  
    def update_password
        @employee = current_employee
      if @employee.update_with_password(employee_params)
        
        # Sign in the user by passing validation in case their password changed
        bypass_sign_in(@employee)
        redirect_to root_path
      else
        render "edit_password"
      end
    end

  
    private
  
    def employee_params
      params.require(:employee).permit(:password, :password_confirmation, :current_password)
    end
end
