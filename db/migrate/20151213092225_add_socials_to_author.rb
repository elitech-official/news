class AddSocialsToAuthor < ActiveRecord::Migration
  def change
    add_column :admin_users, :vk, :string
    add_column :admin_users, :fb, :string
    add_column :admin_users, :twitter, :string
    add_column :admin_users, :instagram, :string
    add_column :admin_users, :rss, :string
  end
end
