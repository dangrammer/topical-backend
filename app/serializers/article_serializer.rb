class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :description, :section, :image_url, :url, :publication_date
  has_many :clippings
  has_many :collections, through: :clippings
end
