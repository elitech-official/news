class Users::OmniauthCallbacksController < ApplicationController
  def facebook
    @user = User.find_for_facebook_oauth request.env["omniauth.auth"]
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect root_path, :event => :authentication
    else
      flash[:notice] = "authentication error"
      redirect_to root_path
    end
  end

  def vkontakte
    @user = User.find_for_vkontakte_oauth request.env["omniauth.auth"]
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Vkontakte"
      sign_in_and_redirect root_path, :event => :authentication
    else
      flash[:notice] = "authentication error"
      redirect_to root_path
    end
  end
  
  def user_params
      params.require(:user).permit( :username, :nickname, :provider, :url, :password, :email, :password_confirmation, :remember_me)
    end
  
end