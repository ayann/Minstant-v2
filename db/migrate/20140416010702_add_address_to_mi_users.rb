class AddAddressToMiUsers < ActiveRecord::Migration
  def change
    add_column :mi_users, :address, :string
  end
end
