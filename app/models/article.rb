class Article < ApplicationRecord
  # has_many :notes
  has_many :clippings
  has_many :collections, through: :clippings
  # has_many :users, through: :notes #=> *inaccurately associates users ONLY through notes*
end
