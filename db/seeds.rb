# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

first_user = User.create(provider: "github", uid: "3", username: "Yaz")
second_user = User.create(provider: "github", uid: "4", username: "Bosco")

first_question = Question.create(title: "Why is the sky blue?", description: "Why is the sky blue? Why isn't it orange or green?", user_id: first_user.id)

second_question = Question.create(title: "Do you yahoo?", description: "It's a question", user_id: second_user.id)

third_question = Question.create(title: "Is there life after death?", description: "That might be an oxymoron", user_id: second_user.id)
