class ClippingSerializer < ActiveModel::Serializer
  attributes :id, :collection_id, :article_id
  has_one :collection
  has_one :article
end
