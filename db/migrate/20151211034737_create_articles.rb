class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.attachment :thumb
      t.string :news

      t.timestamps null: false
    end
  end
end
