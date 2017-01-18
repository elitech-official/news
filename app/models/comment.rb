class Comment < ActiveRecord::Base
  has_ancestry
  belongs_to :commentable, polymorphic: true

  validates :name, presence: true
  validates :text, presence: true
end
