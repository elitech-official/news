class PagesController < ApplicationController
  
  include FilmFan::Commentable
  
  def index
    if params[:category]
      @pages = Page.where(category: params[:category])
    elsif params[:author]
      @pages = Page.where(admin_users: params[:author])
    elsif params[:theme]
      @pages = Page.where(theme: params[:theme])
    elsif params[:tag]
      @pages = Page.tagged_with(params[:tag])
    else
      @pages = Page.all.limit(6)
    end
    #@news = Article.find(:all, :order => "id desc", :limit => 9).reverse
   #TODO
   # add articles & paginate news, do something with carousel in header
  end
  
   def all
    @pages = Page.all.limit(5).reverse
    
    #@news = Article.find(:all, :order => "id desc", :limit => 9).reverse
   #TODO
   # add articles & paginate news, do something with carousel in header
  end

  def show
    @page = Page.friendly.find(params[:id])
    #@see_also = Page.find(:all, :category => @page.category,  :order => "id desc", :limit => 5).reverse
  end
  
  def delete
    @page = Page.friendly.find(params[:id])
    @page.destroy
  end
  
  private
  
  def page_params
    params.require(:page).permit(:header, :body, :tag_list, :theme, :thumb, :category, :admin_user_ids => [] )
  end
end
