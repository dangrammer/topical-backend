class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id
  belongs_to :user
  has_many :clippings, dependent: :destroy
  has_many :articles, through: :clippings
end
