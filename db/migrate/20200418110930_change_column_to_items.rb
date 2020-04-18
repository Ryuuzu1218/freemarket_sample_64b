class ChangeColumnToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :likes, :interger, null: true, default: 0
  end
end
