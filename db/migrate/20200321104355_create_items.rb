class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name,            null: false, index: true
      t.integer     :likes,           null: false
      t.reference   :category,        null: false, foreign_key: true
      t.reference   :user,            null: false, foreign_key: true
      t.integer     :price,           null: false
      t.text        :explanation
      t.string      :brand
      t.string      :condition,       null: false
      t.string      :delivery_charge, null: false
      t.string      :shipping_origin, null: false
      t.integer     :sending_days,    null: false
      t.timestamps
    end
  end
end
