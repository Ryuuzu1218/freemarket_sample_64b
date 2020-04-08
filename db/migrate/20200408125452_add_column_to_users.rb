class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, t.string           null: false, unique: true
    add_column :users, :first_name, t.string         null: false
    add_column :users, :last_name, t.string          null: false
    add_column :users, :first_name_kana, t.string    null: false
    add_column :users, :last_name_kana, t.string     null: false
    add_column :users, :birthday, t.date             null: false
    add_column :users, :password, t.string           null: false
    add_column :users, :money, t.integer             null: false
    add_column :users, :image, t.string              null: false
    add_column :users, :point, t.integer             default: 0
  end
end
