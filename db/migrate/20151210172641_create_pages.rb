class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :header
      t.text :body
      t.boolean :main

      t.timestamps null: false
    end
  end
end
