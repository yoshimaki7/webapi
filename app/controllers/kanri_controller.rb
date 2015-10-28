class KanriController < ActionController::Base
  def index
    @rakuten = Rakutendata.all
  end
end