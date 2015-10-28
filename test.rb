require 'amazon/ecs'
require 'rubygems'
require 'yaml'
require 'nokogiri'
Amazon::Ecs.options = {
          :associate_tag => 'eigogakusyuto-22',
          :AWS_access_key_id => 'AKIAJZQEPR25OBG4A4YA',
          :AWS_secret_key => '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'
}
#ama_keyword = "レッツノート"
amazon = Amazon::Ecs.item_search("レッツノート", :search_index => 'All', :response_group => "Large", :country => 'jp')

amazon.items.each do |item|
    puts item.get('ItemAttributes/Title') #商品タイトル
    puts item.get('ItemAttributes/Manufacturer') #メーカー名
    puts item.get("ItemAttributes/MonitorSize") #モニターサイズ 
    puts item.get("ASIN") #ASIN
    puts item.get("ISBN") #ISBN
    puts item.get('OfferSummary/LowestUsedPrice/Amount') #中古最安価格
    puts item.get('OfferSummary/TotalUsed') #中古出品数
    puts item.get('ItemAttributes/ListPrice/Amount') #新品価格
    puts item.get('OfferSummary/TotalNew') #新品出品数
    puts item.get("LargeImage/URL") #=> 商品画像URL
    puts "http://www.amazon.co.jp/gp/product/#{item.get('ASIN')}?tag=eigogakusyuto-22" #アフィリリンク
end

=begin
putsサンプルソース
item = 
# 各商品ごとに処理
amazon.items.each do |item|

end

=end


