class UserTransactions < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_transactions
  end
end
