class RenameDelivaryChargeColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :delivery_charge_id, :delivery_charge_id
  end
end
