class CreatePagesAdminUsers < ActiveRecord::Migration
  def change
    create_table :pages_admin_users do |t|
      t.integer :page_id
      t.integer :admin_user_id 
      t.timestamps null: false
    end
  end
end
