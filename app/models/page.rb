class Page < ActiveRecord::Base
  
  #relations
  
  has_many :pages_admin_users
  has_many :admin_users, through: :pages_admin_users
  has_many :comments, :as => :commentable, :dependent => :destroy
  
  searchable do
    text :header, :body, :tag_list, :theme, :thumb, :category
  end
  
  # paperclip attachment for header image
  
  has_attached_file :thumb,
    styles: { medium: "300x300>", large: "800x600>" }
  validates_attachment_content_type :thumb, content_type: /\Aimage\/.*\Z/  
  
  has_attachments :regular_images, maximum: 50, accept: [:jpg, :png, :jpeg]
  
  extend FriendlyId
  friendly_id :header, use: :slugged
  
  acts_as_taggable
  acts_as_punchable
  #friendly_id translation & authors
  
  def normalize_friendly_id(text)
    text.to_slug.normalize(transliterations: :russian).to_s
  end
  
  def authors
    self.admin_users.map { |admin| admin.name }
  end
  
end
