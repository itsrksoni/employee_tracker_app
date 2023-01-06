class DivisionsController < ApplicationController

    def index
        @division= Division.all

    end

    def show
       @division= Division.find(params[:id])
    end

    def new 
        @division = Division.new

    end

    def create
        @division = Division.create(params.require(:division).permit(:name))
       


       if @division.save
        
            redirect_to divisions_index_path
       else 
            render "new" , status: :unprocessable_entity
       end
  

    end

    def edit
        @division=Division.find(params[:id])
    end

    def update
        @division=Division.find(params[:id])
        @division = Division.update(params.require(:division).permit(:name))
        redirect_to divisions_index_path

    end

    def destroy
        @division= Division.find(params[:id])
        @division.destroy
        redirect_to divisions_index_path
    
    end


end



