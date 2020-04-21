class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer    :status,       default: 0
      t.integer    :item_id,      null: false, foreign_key: true
      t.integer    :buyer_id,     null: false, foreign_key: true
      t.integer    :saler_id,     null: false, foreign_key: true
      t.integer    :total_fee,    null: false
      t.timestamps
    end
  end
end
