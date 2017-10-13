# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

first_names = %w[Adam Bethany Chloe Daniel Ethan Frank Georgia]
last_names = %w[Brown Davis Jones Miller Smith Williams]
urls = %w[http://google.com http://yahoo.com http://youtube.com http://facebook.com
  http://baidu.com http://wikipedia.org http://reddit.com http://amazon.com
  http://twitter.com http://instagram.com http://linkedin.com http://utruby.org/
]

first_names.each do |fn|
  last_names.each do |ln|
    User.create(
      first_name: fn,
      last_name: ln,
      email: "#{fn}.#{ln}@example.com",
      password: 'test1234'
    )
  end
end

urls.each { |url| Link.create(url: url) }

User.all.each do |user|
  links = Link.all.sample(5)
  links.each do |link|
    description = (0..12).map { ('a'..'z').to_a[rand(26)] }.join
    Bookmark.create(user: user, link: link, description: description)
  end
end
