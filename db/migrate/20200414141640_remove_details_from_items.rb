class RemoveDetailsFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :sending_days, :integer
    remove_column :items, :shipping_origin, :string
    remove_column :items, :delivery_charge, :string
    remove_column :items, :condition, :string
  end
end
