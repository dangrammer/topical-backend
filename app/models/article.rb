class Article < ApplicationRecord
  has_many :clippings
  has_many :collections, through: :clippings
  
  # def formatted_date
  #   self.publication_date.strftime('%B %-d %Y')
  # end


end
