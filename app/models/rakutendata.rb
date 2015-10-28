class Rakutendata < ActiveRecord::Base
    
    def create
        @rakuten = Rakuten.new(params[:rakuten])
        @rakuten.save
    end
end
