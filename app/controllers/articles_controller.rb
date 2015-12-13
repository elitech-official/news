class ArticlesController < ApplicationController  
  
  def index
    @pages = Page.all.where(category: "Новости")
  end
  
  def article_params
    params.requre(:articles).permit(:text, :thumb, :tag_list, :admin_user_id)
  end
  
end
