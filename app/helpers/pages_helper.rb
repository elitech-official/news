module PagesHelper

  def all
    @pages = Page.where.not(category: 'Новости').last(6)
    @articles = Page.where(category: 'Новости').last(9)
    @main_pages = Page.where(main: true)
    @poll = Poll.all.last || Poll.new
  end

  def author
    @author = AdminUser.find(params[:id])
    @pages = @author.pages
  end

  def who
  end

  def add_socials
  end

  def contacts
    @users = AdminUser.where(is_journalist: false)
  end

end
