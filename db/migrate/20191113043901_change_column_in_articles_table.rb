class ChangeColumnInArticlesTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :articles, :content, :section
  end
end
