class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :description, :content, :image_url, :url, :publication_date
  # has_many :notes
  has_many :clippings
  has_many :collections, through: :clippings
  # has_many :users, through: :notes #=> *inaccurately associates users ONLY through notes*
end
