class CreateAmazondata < ActiveRecord::Migration
  def change
    create_table :amazondata do |t|
      t.text :name_AMA
      t.integer :newprice_AMA
      t.integer :usedprice_AMA
      t.integer :newnumber_AMA
      t.integer :usenumber_AMA
      t.integer :newitem_AMA
      t.integer :olditem_AMA
      t.string :maker_AMA
      t.integer :isbn_AMA
      t.string :asin_AMA
      t.text :img_AMA
      t.text :afilink_AMA

      t.timestamps
    end
  end
end
