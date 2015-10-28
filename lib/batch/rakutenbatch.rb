class RakutenBatch

require 'rakuten_web_service'
require 'rubygems'
require 'uri'

RakutenWebService.configuration do |c|
  c.application_id = '7d24ec5ad62c204ac86da780ee7516a6'
  c.affiliate_id = '094577c7.8f5e8882.094577c8.b3b01280'
end

makers = ["東芝　パソコン", "レノボ パソコン", "パナソニック　パソコン", "NEC　パソコン", "富士通　パソコン", "DELL　パソコン", "VAIO　パソコン", "ASUS　パソコン", "acer　パソコン"]
makers.each do |maker|
items = RakutenWebService::Ichiba::Item.search(:keyword => maker) # This returns Enamerable object
RakutenWebService::Ichiba::Genre[552001].name
items.first(1).each do |item|

  nameR = "#{item['itemName']}" #商品名
  priceR = "#{item['itemPrice'] }" #価格
  aR = "#{item['itemUrl']}" #アフィリリンク
  dR = "#{item['itemCaption']}"  #商品説明
  imgR = "#{item['mediumImageUrls']}"  # You can refer to values as well as Hash.
  icR = "#{item['itemCode']}"
    Rakutendata.create({name_RAKU: nameR , price_RAKU: priceR ,afilink_RAKU: aR , desc_RAKU: dR , img_RAKU: imgR , itemcode_RAKU: icR})
end
end
end
=begin
puts sample code
items = RakutenWebService::Ichiba::Item.search(:keyword => 'ガンダム') # This returns Enamerable object
RakutenWebService::Ichiba::Genre[552001].name
items.first(1).each do |item|
  puts "#{item['itemName']}" #商品名
  puts "#{item['itemPrice'] }" #価格
  puts "#{item['itemUrl']}" #アフィリリンク
  puts "#{item['itemCaption']}"  #商品説明
  puts "#{item['mediumImageUrls']}"  # You can refer to values as well as Hash.
  puts "#{item['itemCode']}"
end
=end

