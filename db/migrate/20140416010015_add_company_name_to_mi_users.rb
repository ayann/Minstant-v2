class AddCompanyNameToMiUsers < ActiveRecord::Migration
  def change
    add_column :mi_users, :companyName, :string
  end
end
