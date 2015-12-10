class PagesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end
  
  private
  
  def page_params
    params.require(:page).permit(:header, :body, :tag_list, :theme, :thumb, :author_ids => [] )
  end
end
