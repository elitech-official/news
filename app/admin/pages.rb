ActiveAdmin.register Page do
  permit_params :header, :body, :main, :theme, :category, :preview, :published_at, :tag_list, :thumb, regular_images: [], admin_user_ids: []

  actions :all

  index do
    column :header
    column :main
    column :category
    column :theme
    column :authors
    column :tag_list
    column :published_at
    actions
  end

  controller do
    def show
      @page = Page.friendly.find(params[:id])
      # @page.authors = @page.admin_users.map {|admin| admin.name }
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
      params.require(:page).permit(:header, :body, :theme, :tag_list, :thumb, :category, :preview, :main, admin_user_ids: [], regular_images: [])
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Заголовок статьи' do
      f.input :header, label: 'Заголовок'
      f.input :thumb, required: false, as: :file, label: 'Изображения для заголовка'
      f.input :preview, label: 'Краткое содержание'
      f.label 'На главную ?'
      f.check_box :main
    end

    f.inputs 'Текст статьи' do
      f.cktext_area :body
    end

    f.inputs 'Реквизиты' do
      f.input :admin_users, as: :check_boxes, label: 'Авторы'
      f.input :theme, label: 'Тема'
      f.label 'Категория'
      f.select :category, options_for_select([%w(Новости Новости), %w(Экслюзив Эксклюзив), %w(Возможности Возможности), %w(Лайфстайл Лайфстайл), %w(Советы Советы), %w(Афиша Афиша)])
      f.input :tag_list, label: 'Тэги (через запятую)'
      f.input :published_at, class: 'datepicker'
      f.input :regular_images, as: :formtastic_attachinary
    end
    f.actions
  end
end
