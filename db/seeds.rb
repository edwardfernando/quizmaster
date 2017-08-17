# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Question.create!(question: "How many vowels are there in the English alphabet?", answer: "5")
Question.create!(question: "How many alphabets are there in the English alphabet?", answer: "26")
Question.create!(question: "What is 10-5?", answer: "5")
Question.create!(question: "What is 12/4?", answer: "3")
Question.create!(question: "What is 5+2?", answer: "7")
Question.create!(question: "What is 100*20?", answer: "200")
Question.create!(question: "How many provinces are there in Indonesia?", answer: "34")
Question.create!(question: "How many stars are there on the US flag?", answer: "50")