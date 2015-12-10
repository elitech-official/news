class PagesAdminUser < ActiveRecord::Base
  
  belongs_to :page
  belongs_to :admin_user
  
end
