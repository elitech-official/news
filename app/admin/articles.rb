ActiveAdmin.register Article do
  
  permit_params :news, :tag_list, :thumb, :admin_user_id
  
  actions :all
  
  index do
    id_column
    column :news
    column :tag_list
    column :admin_user
    actions
  end
  

  form :html => { :multipart => true } do |f|
   f.inputs "Новость" do
     f.input :news, :label => "Новость"
     f.input :thumb, :required => false, :as => :file, :label => "Изображение для заголовка"
     
     f.inputs "Тэги" do
        f.input :tag_list , :label => "Тэги (через запятую)"
     end
     
     f.inputs "Авторы" do
       f.input :admin_user
     end
   end
   f.actions
 end

end
