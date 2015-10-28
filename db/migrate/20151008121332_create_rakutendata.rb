class CreateRakutendata < ActiveRecord::Migration
  def change
    create_table :rakutendata do |t|
      t.string :name_RAKU
      t.integer :price_RAKU
      t.boolean :newitem_RAKU
      t.string :maker_RAKU
      t.text :desc_RAKU
      t.string :itemcode_RAKU
      t.text :img_RAKU
      t.text :afilink_RAKU

      t.timestamps
    end
  end
end
