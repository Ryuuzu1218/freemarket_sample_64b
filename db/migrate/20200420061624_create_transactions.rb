class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer    :status,    default: 0
      t.references :item,      null: false, foreign_key: true
      t.references :buyer,     null: false, foreign_key: true
      t.references :saler,     null: false, foreign_key: true
      t.integer    :total_fee, null: false
      t.timestamps
    end
  end
end
