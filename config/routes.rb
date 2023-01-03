Rails.application.routes.draw do
#   devise_for :employees  , :skip => [:registrations] 
# as :employees do
#   get 'employees/edit' => 'devise/registrations#edit', :as => 'edit_employee_registration'
#   put 'employees' => 'devise/registrations#update', :as => 'employee_registration'
# end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
    root to: "home#index"
    
    get 'my_profile', to: 'home#profile', as: 'my_profile'

    # devise_for :employees, controllers: {
    #   sessions: 'employees/sessions',
    #   registrations: 'employees/registrations',
    #   passwords: 'employees/passwords'
    # }

    devise_for :employees,
    controllers: {
         sessions: 'employees/sessions',
         invitations: 'employees/invitations'
    },
    :skip => [:registrations] 
  as :employee do
  get 'employees/edit' => 'employees/registrations#edit', :as => 'edit_employee_registration'
  put 'employees' => 'employees/registrations#update', :as => 'employee_registration'
  end


end
