class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :status
      t.string :title
      t.text :content
      t.string :slug
      t.belongs_to :author, index: true

      t.timestamps null: false
    end
    add_foreign_key :articles, :users, column: :author_id
  end
end
