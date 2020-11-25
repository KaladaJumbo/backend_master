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

question1 = Question.create(answer: "c", level_id: new_user_level.id, note: JSON.unparse("c4"))

user_question1 = UserQuestion.create(user_id: user1.id, question_id: question1.id, status: 0)

tag1 = Tag.create(name: "c")

question_tag1 = QuestionTag.create(tag_id: tag1.id, question_id: question1.id )

arr1 = ["a3", "b3", "c3", "d3", "e3", "f3", "g3"]
arr2 = ["a4", "b4", "c4", "d4", "e4", "f4", "g4"]
arr3 = ["a5", "b5", "c5", "d5", "e5", "f5", "g5"]

arr1.each do |note|
    Question.create(answer: note[0], level_id: new_user_level.id, note: JSON.unparse(note))
end
arr2.each do |note|
    Question.create(answer: note[0], level_id: new_user_level.id, note: JSON.unparse(note))
end
arr3.each do |note|
    Question.create(answer: note[0], level_id: new_user_level.id, note: JSON.unparse(note))
end

arr1 = [[["a2", "c#3", "e3"],"aM"], [["b2","d#3", "f#3"],"bM"], [["c3", "e3", "g3"],"cM"], [["d3", "f#3", "a3"],"dM"], [["e3", "g#3", "b3"],"eM"], [["f3", "a3", "c4"],"fM"], [["g3", "b3", "d4"],"gM"]]
arr2 = [[["a3", "c#4", "e4"],"aM"], [["b3","d#4", "f#4"],"bM"], [["c4", "e4", "g4"],"cM"], [["d4", "f#4", "a4"],"dM"], [["e4", "g#4", "b4"],"eM"], [["f4", "a4", "c4"],"fM"], [["g4", "b4", "d4"],"gM"]]
arr3 = [[["a4", "c#5", "e5"],"aM"], [["b4","d#5", "f#5"],"bM"], [["c5", "e5", "g5"],"cM"], [["d5", "f#5", "a5"],"dM"], [["e5", "g#5", "b5"],"eM"], [["f5", "a5", "c5"],"fM"], [["g5", "b5", "d5"],"gM"]]

arr1.each do |note|
    Question.create(answer: note[1], level_id: new_user_level.id, note: JSON.unparse(note[0]))
end
arr2.each do |note|
    Question.create(answer: note[1], level_id: new_user_level.id, note: JSON.unparse(note[0]))
end
arr3.each do |note|
    Question.create(answer: note[1], level_id: new_user_level.id, note: JSON.unparse(note[0]))
end

