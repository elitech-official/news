class PagesController < ApplicationController
  include NewsComments::Commentable

  def index
    if params[:category]
      @pages = Page.where(category: params[:category]).where.not(category: 'Новости')
      @pages = Page.where(category: 'Новости') if params[:category] == 'Новости'
    elsif params[:theme]
      @pages = Page.where(theme: params[:theme]).where.not(category: 'Новости')
    elsif params[:tag]
      @pages = Page.tagged_with(params[:tag])
    else
      @search = Sunspot.search (Page) do
        fulltext params[:search]
      end
      @pages = @search.results
    end
  end

  def show
    @page = Page.friendly.find(params[:id])
    @page.punch(request)
    @recent_pages = Page.where(category: @page.category).last(5)
    @popular_pages = Page.most_hit
  end

  def delete
    @page = Page.friendly.find(params[:id])
    @page.destroy
  end

  private

  def page_params
    params.require(:page).permit(:header, :body, :tag_list, :theme, :thumb, :category, admin_user_ids: [])
  end
end
