class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :password
  has_many :collections
  has_many :clippings, through: :collections
end
