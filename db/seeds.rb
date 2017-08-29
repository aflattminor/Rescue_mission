# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'GOTfaker'

Answer.destroy_all
Question.destroy_all
1000.times do
  Question.create(title:"#{GOTFaker::Character.random_name}", question_text:"#{GOTFaker::Quote.tyrion_lannister}")
end


100.times do
  Answer.create(answer:"#{GOTFaker::Quote.bad_ass}", user_id:rand(1..10), question_id:rand(1..10))
end
