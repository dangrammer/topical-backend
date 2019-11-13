require 'rest-client'
require 'json'

Article.destroy_all
# User.destroy_all
# Collection.destroy_all
# Clipping.destroy_all

fetch_url = "https://api.nytimes.com/svc/topstories/v2/home.json?api-key=#{ENV['NYT_API_KEY']}"
data = JSON.parse(RestClient.get(fetch_url))

data['results'].map do |article|
  # byebug
  Article.create(
    title: article['title'], 
    author: article['byline'], 
    description: article['abstract'],
    section: article['section'],
    image_url: 'https://strongminds.org/wp-content/uploads/2017/08/NYT-logo.png', #article['multimedia'][1]['url'],
    url: article['url'],
    publication_date: article['published_date'])
end

puts 'SEEDED 🌱'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)