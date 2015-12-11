class AddAdminUserIdToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :admin_user_id, :integer
  end
end
