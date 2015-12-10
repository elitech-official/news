class AddAuthorThemeToPages < ActiveRecord::Migration
  def change
    add_column :pages, :theme, :string
  end
end
