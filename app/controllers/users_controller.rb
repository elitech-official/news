class UsersController < InheritedResources::Base

  private

    def user_params
      params.require(:user).permit(:username, :nickname, :provider, :url)
    end
end

