class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :vkontakte]
  
  has_many :votes, dependent: :destroy
  has_many :vote_options, through: :votes
  
         
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      if auth.provider == "vkontakte"
      user.email = auth.extra.raw_info.id.to_s + "@vk.com"
      elsif auth.provider == 'facebook'
      user.email = auth.info.email
      end
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["facebook_data"] && session["facebook_data"]["extra"]["raw_info"]
        user.email = session["facebook_data"]['email'] if user.email.blank?
        user.password = Devise.friendly_token[0,20] if user.password.blank?
        user.name = data['name']
        user.save!
      end
      if !session["devise.vkontakte_data"].nil?
        data = session["devise.vkontakte_data"]
        user.email = data["email"] if user.email.blank?
        user.password = Devise.friendly_token[0,20] if user.password.blank?
        user.name = data['info']['name']
      end
    end
  end
  
  def voted_for?(poll)
    vote_options(true).any? {|v| v.poll == poll }
  end
  
end
