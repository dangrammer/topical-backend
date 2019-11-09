class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :password
  has_many :collections
  has_many :clippings, through: :collections
  # has_many :notes
  # has_many :articles, through: :notes #=> *inaccurately associates articles ONLY through notes*
end
