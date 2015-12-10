ActiveAdmin.register Page do
  
  permit_params :header, :body, :main, :theme, :author_ids, :tag_list, :thumb
  
  actions :all
  
  index do
    column :header
    column :main
    column :theme
    column :tag_list
  end
  
  controller do
    private
    def page_params
      params.require(:page).permit(:header, :body, :theme, :author_ids, :tag_list, :thumb)
    end
  end
  
  form :html => { :multipart => true } do |f|
   f.inputs "Заголовок статьи" do
     f.input :header, :label => "Заголовок"
     f.input :thumb, :required => false, :as => :file, :label => "Изображения для заголовка"
   end
   
   f.inputs 'Текст статьи' do
     f.cktext_area :body
   end
   
   f.inputs "Реквизиты" do
     f.input :admin_users, :as => :check_boxes, :label => "Авторы"
     f.input :theme, :label => "Тема"
     f.label "Категория"
     f.select :category, options_for_select([["Новости","Новости"],["Экслюзив", "Эксклюзив"],["Возможности", "Возможности"],["Лайфстайл", "Лайфстайл"],["Советы", "Советы"],["Афиша", "Афиша"]])
   end
   f.actions
 end
  
  
  
end
