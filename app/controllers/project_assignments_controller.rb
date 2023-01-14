class ProjectAssignmentsController < ApplicationController
    before_action :authenticate_employee!
    before_action :is_project_manager?


    def create
     
        @project_assignment= ProjectAssignment.create(params.permit(:employee_id,:project_id))
        if @project_assignment.save
            flash[:alert] = "Project Assigned"
            redirect_to projects_index_path
        else
            redirect_to employees_index_path(:id=>params[:employee_id])
        end

    end

    def destroy
       
        employee_id = params[:id]
        
        @project_assignment = ProjectAssignment.find_by(params[:project_id],employee_id)
        @project_assignment.destroy
        redirect_to projects_show_path(employee_id)
    
    end


    private

    def is_project_manager?
        redirect_to root_path unless current_employee.project_manager
    end




end
