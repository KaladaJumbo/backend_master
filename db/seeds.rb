# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Level.destroy_all
QuestionTag.destroy_all
Question.destroy_all
Tag.destroy_all
UserQuestion.destroy_all


new_user_level = Level.create(name: "newUser")
beginner_level = Level.create(name: "beginner")
intermediate_level = Level.create(name: "intermediate")
advanced_level = Level.create(name: "advanced")

user1 = User.create(username: "new_username", level_id: new_user_level.id, password: "password")

question1 = Question.create(answer: "c4", level_id: new_user_level.id)

user_question1 = UserQuestion.create(user_id: user1.id, question_id: question1.id, status: 0)

tag1 = Tag.create(name: "c")

question_tag1 = QuestionTag.create(tag_id: tag1.id, question_id: question1.id )
