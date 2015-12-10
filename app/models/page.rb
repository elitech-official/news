class Page < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :header, use: :slugged
  acts_as_taggable
  
  def normalize_friendly_id(text)
    text.to_slug.normalize.to_s
  end
  
  
end
