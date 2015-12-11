class ArticlesController < ApplicationController  
  
  def article_params
    params.requre(:articles).permit(:text, :thumb, :tag_list, :admin_user_id)
  end
  
end
