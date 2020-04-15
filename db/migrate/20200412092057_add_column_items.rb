class AddColumnItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :transaction_status, :integer, default: 1
  end
end
