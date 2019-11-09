require 'rest-client'
require 'json'

User.destroy_all
Collection.destroy_all
Clipping.destroy_all
Article.destroy_all
# Note.destroy_all

fetch_url = "https://api.nytimes.com/svc/news/v3/content/all/all.json?api-key=#{ENV[NYT_API_KEY]}"
data = JSON.parse(RestClient.get(fetch_url))

user1 = User.create(name: 'Homer', username: 'homiedoh', password: 'hjs')
user2 = User.create(name: 'Bart', username: 'elbarto', password: 'eatmyshorts')

data["results"].map do |article|
  Article.create(
    title: article['title'],
    author: article['byline'],
    description: article['abstract'],
    content: '', # !!! remove `content` from db table
    image_url: article['multimedia'][3]['url'],
    url: article['url'],
    publication_date: article['published_date']
  )
end

collection1 = Collection.create(name: 'R Tickles', user_id: user1.id)
collection2 = Collection.create(name: 'Rad Articles' , user_id: user2.id)

clipping1 = Clipping.create(collection_id: collection1.id, article_id: Article.first.id)
clipping2 = Clipping.create(collection_id: collection1.id, article_id: Article.second.id)
clipping3 = Clipping.create(collection_id: collection1.id, article_id: Article.third.id)
clipping4 = Clipping.create(collection_id: collection2.id, article_id: Article.fourth.id)
clipping5 = Clipping.create(collection_id: collection2.id, article_id: Article.fifth.id)
clipping6 = Clipping.create(collection_id: collection2.id, article_id: Article.last.id)

puts 'SEEDED 🌱'
puts data['results'].last


# article1 = Article.create(
#   title: 'Springfield Gets Monorail',
#   author: 'Barney',
#   description: 'Monorail!',
#   content: 'Get ready for the Monorail!',
#   image_url: 'https://www.dummylink.com/image',
#   url: 'https://www.dummylink.com/story',
#   publication_date: 'NOV 7 2019'
# )

# article2 = Article.create(
#   title: 'Moe\'s Tavern Open Again',
#   author: 'Barney',
#   description: 'Drink up!',
#   content: 'The local hang is back in business.',
#   image_url: 'https://www.dummylink.com/image',
#   url: 'https://www.dummylink.com/story',
#   publication_date: 'OCT 28 2019'
# )

# article3 = Article.create(
#   title: 'Chief Wiggum On the Lamb',
#   author: 'Smithers',
#   description: 'No Law in Springfield',
#   content: 'Wiggum has flown the coop!',
#   image_url: 'https://www.dummylink.com/image',
#   url: 'https://www.dummylink.com/story',
#   publication_date: 'NOV 1 2019'
# )

# article4 = Article.create(
#   title: 'Comic Book Guy Sells Store',
#   author: 'Lisa',
#   description: 'By gosh!',
#   content: 'All comics must go!',
#   image_url: 'https://www.dummylink.com/image',
#   url: 'https://www.dummylink.com/story',
#   publication_date: 'OCT 14 2019'
# )

# article5 = Article.create(
#   title: 'Principal Skinner Loves Mother',
#   author: 'Nelson',
#   description: 'Mother Lover',
#   content: 'Skinner still lives with his mom.',
#   image_url: 'https://www.dummylink.com/image',
#   url: 'https://www.dummylink.com/story',
#   publication_date: 'NOV 2 2019'
# )

# article6 = Article.create(
#   title: 'Sideshow Bob Escapes Prison',
#   author: 'Lisa',
#   description: 'Watch out Bart!',
#   content: 'Deranged killer ex-clown on the loose again.',
#   image_url: 'https://www.dummylink.com/image',
#   url: 'https://www.dummylink.com/story',
#   publication_date: 'SEPT 30 2019'
# )

# note1 = Note.create(content: 'Woo hoo!', user_id: user1.id, article_id: article2.id)
# note2 = Note.create(content: 'Funny police run away.', user_id: user1.id, article_id: article3.id)
# note3 = Note.create(content: 'School\'s out sucker', user_id: user2.id, article_id: article4.id)
# note4 = Note.create(content: 'Yikes!', user_id: user2.id, article_id: article5.id)


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)