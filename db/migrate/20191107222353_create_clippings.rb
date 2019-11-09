class CreateClippings < ActiveRecord::Migration[6.0]
  def change
    create_table :clippings do |t|
      t.bigint :collection_id
      t.bigint :article_id

      t.timestamps
    end
  end
end
