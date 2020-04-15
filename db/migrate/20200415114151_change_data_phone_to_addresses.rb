class ChangeDataPhoneToAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :Addresses, :phone, :string
  end
end
