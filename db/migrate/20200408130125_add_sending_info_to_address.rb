class AddSendingInfoToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :sending_first_name, :string,       null: false
    add_column :addresses, :sending_last_name, :string,        null: false
    add_column :addresses, :sending_first_name_kana, :string,  null: false
    add_column :addresses, :sending_last_name_kana, :string,   null: false
    add_column :addresses, :postal_code, :integer,             null: false
    add_column :addresses, :phone, :integer,                   null: false, foreign_key: true
  end
end
