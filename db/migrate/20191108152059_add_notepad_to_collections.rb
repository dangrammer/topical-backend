class AddNotepadToCollections < ActiveRecord::Migration[6.0]
  def change
    add_column :collections, :notepad, :text
  end
end
