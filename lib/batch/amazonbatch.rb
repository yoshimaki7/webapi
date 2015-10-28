class AmazonBatch
  require 'amazon/ecs'
  require 'rubygems'
  require 'yaml'
  require 'nokogiri'

  Amazon::Ecs.options = {
    :associate_tag => 'eigogakusyuto-22',
    :AWS_access_key_id => 'AKIAJZQEPR25OBG4A4YA',
    :AWS_secret_key => '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'
  }

  makers = ["東芝　パソコン", "レノボ パソコン", "パナソニック　パソコン", "NEC　パソコン", "富士通　パソコン", "DELL　パソコン", "VAIO　パソコン", "ASUS　パソコン", "acer　パソコン"]
  makers.each do |maker|
    amazon = Amazon::Ecs.item_search(maker, :search_index => 'All', :response_group => "Large", :country => 'jp')

    amazon.items.each do |item|
      nameA     = item.get('ItemAttributes/Title') #商品タイトル
      makerA     = item.get('ItemAttributes/Manufacturer') #メーカー名
      asinA      = item.get("ASIN") #ASIN
      isbnA      = item.get("ISBN") #ISBN
      usedpriceA = item.get('OfferSummary/LowestUsedPrice/Amount') #中古最安価格
      usenumberA = item.get('OfferSummary/TotalUsed') #中古出品数
      newpriceA  = item.get('ItemAttributes/ListPrice/Amount') #新品価格
      newnumberA = item.get('OfferSummary/TotalNew') #新品出品数
      imgA       = item.get("LargeImage/URL") #=> 商品画像URL
      afilinkA  = "http://www.amazon.co.jp/gp/product/#{item.get('ASIN')}?tag=eigogakusyuto-22" #アフィリリンク
      puts newpriceA
      Amazondata.create({name_AMA: nameA , newprice_AMA: newpriceA , usedprice_AMA: usedpriceA ,newnumber_AMA: newnumberA, usenumber_AMA: usenumberA , maker_AMA: makerA ,  isbn_AMA: isbnA , asin_AMA: asinA , img_AMA: imgA , afilink_AMA: afilinkA})
    end
  end
end