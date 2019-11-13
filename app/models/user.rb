class User < ApplicationRecord
  has_secure_password

  validates_presence_of :username
  validates_uniqueness_of :username, :case_sensitive => false
  
  has_many :collections
  has_many :clippings, through: :collections
end
