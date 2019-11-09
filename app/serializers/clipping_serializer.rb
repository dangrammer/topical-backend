class ClippingSerializer < ActiveModel::Serializer
  attributes :id, :collection_id, :article_id
  belongs_to :collection
  belongs_to :article
end
