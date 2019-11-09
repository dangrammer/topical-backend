class Collection < ApplicationRecord
  belongs_to :user
  has_many :clippings, dependent: :destroy
  has_many :articles, through: :clippings
end
