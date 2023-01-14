class ProjectsController < ApplicationController
    before_action :authenticate_employee!
    before_action :is_project_manager? , except: [:index, :show]

    def index
        @project = Project.all
    end

    def show
        @project = Project.find(params[:id])
    end

    def new
        @project = Project.new
    end

    def create
        
        @project = Project.create(params.require(:project).permit(:name))
      

        if @project.save
            redirect_to projects_index_path
        else
            render "new" , status: :unprocessable_entity
        end

    end

    private

    def is_project_manager?
        redirect_to root_path unless current_employee.project_manager
    end


    

end
