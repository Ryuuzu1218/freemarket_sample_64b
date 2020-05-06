class Transaction < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references    :item,         null: false, foreign_key: true
      t.references    :buyer,        foreign_key: { to_table: :users }, null: false
      t.references    :seller,       foreign_key: { to_table: :users }, null: false
      t.timestamps
    end
  end
end
