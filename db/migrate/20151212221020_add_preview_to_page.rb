class AddPreviewToPage < ActiveRecord::Migration
  def change
    add_column :pages, :preview, :string
  end
end
