require 'rest-client'
require 'json'

Article.destroy_all
# User.destroy_all
# Collection.destroy_all
# Clipping.destroy_all

fetch_url = "https://api.nytimes.com/svc/topstories/v2/home.json?api-key=#{ENV['NYT_API_KEY']}"
data = JSON.parse(RestClient.get(fetch_url))

data['results'].map do |article|
  if article['multimedia'][4] == nil
    image = 'https://strongminds.org/wp-content/uploads/2017/08/NYT-logo.png'
  else
    image = article['multimedia'][4]['url']
  end
  
  Article.create(
    title: article['title'], 
    author: article['byline'], 
    description: article['abstract'],
    section: article['section'],
    image_url: image,
    url: article['url'],
    publication_date: article['published_date'])
end

puts 'SEEDED 🌱'
