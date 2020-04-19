class AddDetailsToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :sending_days_id, :integer,     null: false
    add_column :items, :shipping_origin_id, :integer,  null: false
    add_column :items, :delivery_charge_id, :integer,  null: false
    add_column :items, :condition_id, :integer,        null: false
  end
end
