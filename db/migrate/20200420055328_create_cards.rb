class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.references,  :user,        null: false, foreign_key: true
      t.references,  :customer_id, null: false, foreign_key: true
      t.references,  :card_id,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
