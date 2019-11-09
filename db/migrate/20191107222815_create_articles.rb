class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.text :description
      t.text :content
      t.string :image_url
      t.string :url
      t.string :publication_date

      t.timestamps
    end
  end
end
