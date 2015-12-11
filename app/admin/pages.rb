ActiveAdmin.register Page do
  
  permit_params :header, :body, :main, :theme, :category, :tag_list, :thumb, :admin_user_ids => []
  
  actions :all
  
  index do
    column :header
    column :main
    column :category
    column :theme
    column :authors
    column :tag_list
    actions
  end
  
  controller do
    
    def show
      @page = Page.friendly.find(params[:id])
      @page.author = @page.admin_users.map {|admin| admin.name }
    end
    
    def edit
      @page = Page.friendly.find(params[:id])
    end
    
    def update
      @page = Page.friendly.find(params[:id])
      super
    end
    
    def destroy
      @page = Page.friendly.find(params[:id])
      super
    end
    
    private
    def page_params
      params.require(:page).permit(:header, :body, :theme, :tag_list, :thumb, :category, :main, :admin_user_ids =>[])
    end
  end
  
  form :html => { :multipart => true } do |f|
   f.inputs "Заголовок статьи" do
     f.input :header, :label => "Заголовок"
     f.input :thumb, :required => false, :as => :file, :label => "Изображения для заголовка"
     f.label "На главную ?"
     f.check_box :main
   end
   
   f.inputs 'Текст статьи' do
     f.cktext_area :body
   end
   
   f.inputs "Реквизиты" do
     f.input :admin_users, :as => :check_boxes, :label => "Авторы"
     f.input :theme, :label => "Тема"
     f.label "Категория"
     f.select :category, options_for_select([["Новости","Новости"],["Экслюзив", "Эксклюзив"],["Возможности", "Возможности"],["Лайфстайл", "Лайфстайл"],["Советы", "Советы"],["Афиша", "Афиша"]])
     f.input :tag_list, :label => "Тэги (через запятую)"
     
   end
   f.actions
 end
  
  
  
end
