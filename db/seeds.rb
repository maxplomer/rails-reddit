# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.new(:username => "NYC Cat Lover", :password => "NYC Cat Lover").save!

["Persian Cats", "Siamese Cats", "American Bobtail"].each do |sub|
  Sub.new(:title => sub, :description => sub, :moderator_id => 1).save!
end

Post.new(
  :title => "I like persians cats",
  :url => "news.google.com",
  :content => "a lot",
  :sub_id => 1,
  :author_id => 1
).save!

Post.new(
  :title => "I like persians cats2",
  :url => "news.google.com",
  :content => "a lot2",
  :sub_id => 1,
  :author_id => 1
).save!

Post.new(
  :title => "I like persians cats3",
  :url => "news.google.com",
  :content => "a lot3",
  :sub_id => 1,
  :author_id => 1
).save!

#rake db:drop db:create db:migrate db:seed