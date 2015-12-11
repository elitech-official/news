class AddAttachmentsToAdminAndPage < ActiveRecord::Migration
  def change
    
    add_attachment :admin_users, :avatar
    add_attachment :pages, :thumb
    
  end
end
