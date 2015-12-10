ActiveAdmin.register News do
  actions :all;
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
index do
  column :header
  column :main
end
  
  controller do
    private
    def page_params
      params.require(:page).permit(:header, :body, :theme, :author, :tag_list, :thumb)
    end
  end
  
  form :html => { :multipart => true } do |f|
   f.inputs "Заголовок статьи" do
     f.input :header
     f.input :thumb, :required => false, :as => :file
   end
  
   f.inputs "Реквизиты" do
     collection_check_boxes(:page, :author_id, Author.all, :id, :name_with_initial)
     f.input :theme
   end
   f.actions
 end
  
  
  
end
