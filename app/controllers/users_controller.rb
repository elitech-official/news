class UsersController < InheritedResources::Base

  private

    def user_params
      params.require(:user).permit( :username, :nickname, :provider, :url, :password, :email, :password_confirmation, :remember_me)
    end
end

