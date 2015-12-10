class AddAuthorThemeToPages < ActiveRecord::Migration
  def change
    add_column :pages, :author, :string
    add_column :pages, :theme, :string
  end
end
