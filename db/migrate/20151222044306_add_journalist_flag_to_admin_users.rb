class AddJournalistFlagToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :is_journalist, :boolean
  end
end
