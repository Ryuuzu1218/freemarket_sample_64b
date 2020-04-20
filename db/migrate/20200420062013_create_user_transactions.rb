class CreateUserTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_transactions do |t|
      t.references :buyer 
      t.references :saler
      t.references :transaction
      t.timestamps
    end
  end
end
