class Article < ActiveRecord::Base
  
  belongs_to :admin_user
  acts_as_taggable
  
  has_attached_file :thumb,
    styles: { small: "150x150>", medium: "300x300" }
  validates_attachment_content_type :thumb, content_type: /\Aimage\/.*\Z/  
  
  
end
