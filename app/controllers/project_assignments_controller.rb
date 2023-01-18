class ProjectAssignmentsController < ApplicationController
    before_action :authenticate_employee!
    before_action :is_project_manager?


    def assign_project
        @employee = Employee.new
        @project_assignment= ProjectAssignment.new(params.require(:project_assignment).permit(:employee_id,:project_id))
        if @project_assignment.save
            flash[:alert] = "Project Assigned"
            redirect_to projects_index_path
        else
            
            redirect_to employees_index_path(:id=>" ")
        end

    end

    # def edit
    #     @project_assignment= projectAssignmen.find(params[:id])
    # end

    # def update
    #     @project_assignment= rojectAssignmen.find(params[:id])
        
    #     if @project_assignment.update(params.permit(:employee_id,:project_id)
    #     flash[:alert] = "Project Assignment Updated"
    #     redirect_to project_assigned_index_path
    #     else

    #         redirect_to project_assigned_edit_path(@project_assignment.id)
    #         flash[:alert] = "Error"
    #     end

    # end

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
