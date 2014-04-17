class AddTelToMiUsers < ActiveRecord::Migration
  def change
    add_column :mi_users, :tel, :string
  end
end
