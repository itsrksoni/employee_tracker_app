# frozen_string_literal: true

class Employees::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :authenticate_employee!
  #before_action :is_hr_manager? , only: [:edit, :update]


  def index
    @employee = Employee.all
    @emp= (params[:id]).to_i
    @project = Project.all
  end

  # GET /resource/sign_up
  # def new
  #   #redirect_to new_employee_session_path and return
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
    @employee=Employee.find(params[:id])
    super
  end

  # edit password/ additional field added for password change
  def edit_password
    @employee=Employee.find(params[:id])
    
  end

  # PUT /resource
  def update

    super
    debugger
 
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
   # devise_parameter_sanitizer.permit(:account_update, except: [:password])
   if current_employee.hr_manager
    devise_parameter_sanitizer.permit(:account_update, keys: [:image, :name, :username])
   else
    devise_parameter_sanitizer.permit(:account_update, keys: [:image, :password, :password_confirmation], except: [:email, :username, :name])
   end

  end
  def update_resource(resource, params)
    resource.update_without_password(params)
  end


#   def is_hr_manager?
#     redirect_to root_path unless current_employee.hr_manager
# end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
