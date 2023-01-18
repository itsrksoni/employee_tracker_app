class HomeController < ApplicationController
    before_action :authenticate_employee!

    #root 
    def index
        
    end

end
