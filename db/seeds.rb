# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
desc = "Twenty Characters!! Twenty Characters!! Twenty Characters!! Twenty Characters!! Twenty Characters!! Twenty Characters!! Twenty Characters!! Twenty Characters!! "
titl = "Wow this is really long!!! Kind of silly for a title"

resp = "fifty charaacters! fifty charaacters! fifty charaacters! "

Question.create!(title: titl, description: desc)
Question.create!(title: titl + ", second", description: desc)
Question.create!(title: titl+ ", third", description: desc)
puts "Created questions"

Response.create!(description: resp, question_id: 1)
Response.create!(description: resp + ", second", question_id: 1)
Response.create!(description: resp, question_id: 2)
puts "Created responses"
