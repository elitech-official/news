class AddOccupyToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :occupy, :string
  end
end
