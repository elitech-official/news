class Page < ActiveRecord::Base
  
  has_many :pages_admin_users
  has_many :admin_users, through: :pages_admin_users
  
  has_attached_file :thumb,
    styles: { medium: "300x300>", large: "800x600>" }
  validates_attachment_content_type :thumb, content_type: /\Aimage\/.*\Z/  
  
  
  extend FriendlyId
  friendly_id :header, use: :slugged
  acts_as_taggable
  
  def normalize_friendly_id(text)
    text.to_slug.normalize.to_s
  end
  
  
end
