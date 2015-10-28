class Amazondata < ActiveRecord::Base
    
    
    def create
        @amazon = Amazon.new(params[:amazon])
        @amazon.save
    end
end
