class AddEmailToOpenfireUsers < ActiveRecord::Migration
  def change
    add_column :openfire_users, :email, :string
  end
end
