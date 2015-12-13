class PagesController < ApplicationController
  
  include FilmFan::Commentable
  
  def index
    if params[:category]
      @pages = Page.where(category: params[:category])
      @articles = Article.where(category: params[:category])
    elsif params[:theme]
      @pages = Page.where(theme: params[:theme])
      @articles = Article.where(theme: params[:theme])
    elsif params[:tag]
      @pages = Page.tagged_with(params[:tag])
      @articles = Article.tagged_with(params[:tag])
    else
      @pages = Page.all
      @articles = Article.all
    end
    @pages.paginate(:page => params[:page], :per_page => 10)
    @articles.paginate(:page => params[:page], :per_page => 20)
  end
  
   def all
    @pages = Page.last(6)
    @articles = Article.last(9)
  end
  
  def author
    @author = AdminUser.find(params[:id])
    render 'author'
  end
  
  def show
    @page = Page.friendly.find(params[:id])
    @recent_pages = Page.where(category: @page.category).last(5)
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
