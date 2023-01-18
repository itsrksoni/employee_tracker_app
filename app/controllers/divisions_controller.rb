class DivisionsController < ApplicationController
    before_action :set_division, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_employee!
    before_action :is_hr_manager?

    def index

        @division= Division.all

    end

    def show
       
    end

    def new 

        @division = Division.new

    end

    def create

        @division = Division.create(division_params)
       if @division.save
            flash[:alert] = "Division Created"
            redirect_to divisions_index_path
       else 
            render "new" , status: :unprocessable_entity
       end
  
    end

    def edit
        
    end

    def update
        
        if @division.update(division_params)
        flash[:alert] = "Division Updated"
        redirect_to divisions_index_path
        else

            redirect_to divisions_edit_path(@division.id)
            flash[:alert] = "Enter Valid Division Name"
        end

    end

    def destroy
        
        @division.destroy
        redirect_to divisions_index_path
    
    end
    
private

    def is_hr_manager?

        redirect_to root_path unless current_employee.hr_manager
    end

    def set_division

        @division= Division.find(params[:id])

    end

    def division_params

        params.require(:division).permit(:name)

    end



end



