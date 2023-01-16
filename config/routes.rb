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
         invitations: 'employees/invitations',
         passwords: 'employees/passwords'
    },
    :skip => [:registrations] 
  as :employee do
  get 'employees/:id' => 'employees/registrations#index', :as => 'employees_index'
  get 'employees/edit/:id' => 'employees/registrations#edit', :as => 'edit_employee_registration'
  get 'employees/edit/:id/change_password' => 'employees/registrations#edit_password', :as => 'edit_employee_registration_password'
  put 'employees' => 'employees/registrations#update', :as => 'employee_registration'
  end

  # routes for divisions controller
  get 'divisions' => 'divisions#index', :as => 'divisions_index'
  get 'divisions/show/:id' => 'divisions#show', :as => 'divisions_show'
  post 'divisions' => 'divisions#create'
  get 'divisions/new' => 'divisions#new', :as => 'new_division'
  delete 'divisions/:id/delete' => 'divisions#destroy', as: 'divisions_delete'
  get '/divisions/:id/edit' => 'divisions#edit', as: 'divisions_edit'
  patch  '/divisions/:id' => 'divisions#update', as: 'update_division'
  put   '/divisions/:id' => 'divisions#update'
  get '/divisions/:id/delete' => 'divisions#destroy'
 

  # routes for projects controller

  get 'projects' => 'projects#index', as: 'projects_index'
  get 'projects/new' => 'projects#new', as: 'new_projects'
  get 'projects/:id' => 'projects#show', as: 'projects_show'
  post 'projects/create' => 'projects#create', as: 'projects'

   # routes for project_assignment controller

   post 'project_assignmnet/create' => 'project_assignments#create', as: 'project_assignment'
   delete '/projects/:project_id/:id' => 'project_assignments#destroy', as: 'project_assignment_delete'
 


end
