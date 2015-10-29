class StaticPagesController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :check_logged_in, :only => [:kanri, :update]
  def index
  end
  

  def cate
    # 全データをとってきて、@rakuten というインスタンス変数に格納
    # この後、app/views/cate.html.erb に飛ぶ (Rails の仕様)
    @category = params["cate"]
    if @category == "toshiba"
      @category = "東芝"
    elsif @category == "lenovo"
      @category = "lenovo"
    elsif @category == "panasonic"
      @category = "panasonic"  
    elsif @category == "nec"
      @category = "NEC"  
    elsif @category == "fujitsu"
      @category = "富士通" 
    elsif @category == "DELL"
      @category = "DELL"  
    elsif @category == "vaio"
      @category = "vaio"       
    elsif @category == "asus"
      @category = "ASUS"       
    elsif @category == "acer"
      @category = "日本エイサー"        
    end
    @rakuten = Rakutendata.all
    @amazon = Amazondata.where(maker_AMA: @category)
  end

  def tail
    # ここに id が渡ってくる
    # 例えば Amazon なら B00UT4R3RU など
    # Amazondata.where で検索をかける
    @rakuten = Rakutendata.where(itemcode_RAKU: params[:id])
    @amazon = Amazondata.where(asin_AMA: params[:id])
    puts "~~~~~~~~~~~~~~"
    puts @rakuten.first
    puts "~~~~~~~~~~~~~~"
  end

  def useditem
    #binding.pry
    @rakuten = Rakutendata.where(newitem_RAKU: false)
    @amazon = Amazondata.where('usenumber_AMA > ?', 0 )
  end
  def newitem
    @rakuten = Rakutendata.where(newitem_RAKU: true)
    @amazon = Amazondata.where('newnumber_AMA > ?', 0)
  end

  def kanri
    @rakuten = Rakutendata.all
  end

  def update
    @rakuten = Rakutendata.find(params[:id])
    @rakuten.update_attributes(params[:rakuten])
  end
  
  def destroy
    @rakuten = Rakutendata.find(params[:id])
  end

 private
  def check_logged_in
   authenticate_or_request_with_http_basic("webapisample-yoshi7-1.c9.io") do |username, password|
    username == "admin" && password == "password"
  end
 end
end