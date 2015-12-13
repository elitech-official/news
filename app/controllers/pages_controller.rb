class PagesController < ApplicationController
  
  include FilmFan::Commentable
  
  def index
    if params[:category]
      @pages = Page.where(category: params[:category]).where.not(category: "Новости")
      if params[:category] == "Новости"
        @pages = Page.where(category: "Новости")
      end
    elsif params[:theme]
      @pages = Page.where(theme: params[:theme]).where.not(category: "Новости")
    elsif params[:tag]
      @pages = Page.tagged_with(params[:tag])
      @articles = Article.tagged_with(params[:tag])
    else
      @pages = Page.all
    end
  end
  
   def all
    @pages = Page.where.not(category: "Новости").last(6)
    @articles = Page.where(category: "Новости").last(9)
    @main_pages = Page.where(main: true)
  end
  
  def author
    @author = AdminUser.find(params[:id])
    @pages = @author.pages
    render 'author'
  end
  
  def who
    render 'who'
  end
  
  def contacts
    @users = AdminUser.all
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
