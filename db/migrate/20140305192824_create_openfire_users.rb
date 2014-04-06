class CreateOpenfireUsers < ActiveRecord::Migration
  def change
    create_table :openfire_users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :groups
      t.references :mi_user, index: true

      t.timestamps
    end
  end
end
