class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pages_admin_users
  has_many :pages, through: :pages_admin_users
  has_many :articles

  has_attached_file :avatar,
                    styles: { small: '150x150>', medium: '300x300', large: '800x600>' }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
