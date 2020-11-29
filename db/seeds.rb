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

#dependency initialization
new_user_level = Level.create(name: "newUser")
beginner_level = Level.create(name: "beginner")
intermediate_level = Level.create(name: "intermediate")
advanced_level = Level.create(name: "advanced")

user1 = User.create(username: "test", level_id: new_user_level.id, password: "test")

multi_note = ["a","b","c","d","e","f","g"]

#universal tags
multi_note.each {|note| Tag.create(name: note)}
tag2 = Tag.create(name: "notes")
tag3 = Tag.create(name: "chords")
major = Tag.create(name: "major")
minor = Tag.create(name: "minor")
majorvsminor = Tag.create(name: "major vs minor")


#question creation 

arr1 = ["a3", "b3", "c3", "d3", "e3", "f3", "g3"]
arr2 = ["a4", "b4", "c4", "d4", "e4", "f4", "g4"]
arr3 = ["a5", "b5", "c5", "d5", "e5", "f5", "g5"]


arr1.each do |note|
    q = Question.create(answer: note[0], level_id: new_user_level.id, note: JSON.unparse(note), multipleChoice: JSON.unparse(multi_note.sample(4)))
    QuestionTag.create(tag_id: tag2.id, question_id: q.id)
    t = Tag.find_by(name: note[0])
    QuestionTag.create(tag_id: t.id, question_id: q.id)

end
arr2.each do |note|
    q = Question.create(answer: note[0], level_id: new_user_level.id, note: JSON.unparse(note), multipleChoice: JSON.unparse(multi_note.sample(4)))
    question_tag2 = QuestionTag.create(tag_id: tag2.id, question_id: q.id )
    t = Tag.find_by(name: note[0])
    QuestionTag.create(tag_id: t.id, question_id: q.id)

end
arr3.each do |note|
    q = Question.create(answer: note[0], level_id: new_user_level.id, note: JSON.unparse(note), multipleChoice: JSON.unparse(multi_note.sample(4)))
    question_tag2 = QuestionTag.create(tag_id: tag2.id, question_id: q.id )
    t = Tag.find_by(name: note[0])
    QuestionTag.create(tag_id: t.id, question_id: q.id)

end


arr1 = [[["ab2", "c3", "eb3"],"abM"], [["a2", "c#3", "e3"],"aM"], [["bb2","d3", "f3"],"bbM"], [["b2","d#3", "f#3"],"bM"], [["cb3", "eb3", "gb3"],"cbM"], [["c3", "e3", "g3"],"cM"], [["c#3", "e#3", "g#3"],"c#M"], [["db3", "f3", "ab3"],"dbM"], [["d3", "f#3", "a3"],"dM"], [["eb3", "g3", "bb3"],"ebM"], [["e3", "g#3", "b3"],"eM"], [["fb3", "ab3", "cb4"],"fbM"], [["f3", "a3", "c4"],"fM"], [["f#3", "a#3", "c#4"],"f#M"], [["gb3", "bb3", "db4"],"gbM"],[["g3", "b3", "d4"],"gM"],[["g#3", "b#3", "d#4"],"g#M"]]
arr2 = [[["ab3", "c4", "eb4"],"abM"], [["a3", "c#4", "e4"],"aM"], [["bb3","d4", "f4"],"bbM"], [["b3","d#4", "f#4"],"bM"], [["cb4", "eb4", "gb4"],"cbM"], [["c4", "e4", "g4"],"cM"], [["c#4", "e#4", "g#4"],"c#M"], [["db4", "f4", "ab4"],"dbM"], [["d4", "f#4", "a4"],"dM"], [["eb4", "g4", "bb4"],"ebM"], [["e4", "g#4", "b4"],"eM"], [["fb4", "ab4", "cb5"],"fbM"], [["f4", "a4", "c5"],"fM"], [["f#4", "a#4", "c#5"],"f#M"], [["gb4", "bb4", "db5"],"gbM"],[["g4", "b4", "d5"],"gM"],[["g#4", "b#4", "d#5"],"g#M"]]
arr3 = [[["ab4", "c5", "eb5"],"abM"], [["a4", "c#5", "e5"],"aM"], [["bb4","d5", "f5"],"bbM"], [["b4","d#5", "f#5"],"bM"], [["cb5", "eb5", "gb5"],"cbM"], [["c5", "e5", "g5"],"cM"], [["c#5", "e#5", "g#5"],"c#M"], [["db5", "f5", "ab5"],"dbM"], [["d5", "f#5", "a5"],"dM"], [["eb5", "g5", "bb5"],"ebM"], [["e5", "g#5", "b5"],"eM"], [["fb5", "ab5", "cb6"],"fbM"], [["f5", "a5", "c6"],"fM"], [["f#5", "a#5", "c#6"],"f#M"], [["gb5", "bb5", "db6"],"gbM"],[["g5", "b5", "d6"],"gM"],[["g#5", "b#5", "d#6"],"g#M"]]

multiChords = ["aM", "abM", "bbM", "bM", "cbM", "cM", "c#M", "dbM", "dM", "ebM", "eM", "fbM", "fM", "f#M", "gbM", "gM", "g#M", "am", "abm", "bbm", "bm", "cm", "c#m", "dm", "ebm", "em", "fm", "f#m", "gm"]
mvmanswers = ["Major(M)", "Minor(m)"]

def multipleSelector(arr, ans, num)
    multi_choice_ans_arr = [ans]
    while(multi_choice_ans_arr.length < num ) 
        random = arr.sample
        if (!multi_choice_ans_arr.include?(random))
            multi_choice_ans_arr.push (random)
        end
    end
    return multi_choice_ans_arr.shuffle
end


arr1.each do |note|
    arr = multipleSelector(multiChords, note[1], 4)

    q2 = Question.create(answer: note[1], level_id: new_user_level.id, note: JSON.unparse(note[0]), multipleChoice: JSON.unparse(arr) )

    QuestionTag.create(tag_id: tag3.id, question_id: q2.id )
    QuestionTag.create(tag_id: major.id, question_id: q2.id )
    t = Tag.find_by(name: note[1][0])
    QuestionTag.create(tag_id: t.id, question_id: q2.id)

    qMvM = Question.create(answer: "Major(M)", level_id: new_user_level.id, note: JSON.unparse(note[0]), multipleChoice: JSON.unparse(mvmanswers) )
    QuestionTag.create(tag_id: tag3.id, question_id: qMvM.id )
    QuestionTag.create(tag_id: major.id, question_id: qMvM.id )
end
arr2.each do |note|
    arr = multipleSelector(multiChords, note[1], 4)

    q2 = Question.create(answer: note[1], level_id: new_user_level.id, note: JSON.unparse(note[0]), multipleChoice: JSON.unparse(arr))

    question_tag3 = QuestionTag.create(tag_id: tag3.id, question_id: q2.id )
    question_tag2 = QuestionTag.create(tag_id: major.id, question_id: q2.id )
    t = Tag.find_by(name: note[1][0])
    QuestionTag.create(tag_id: t.id, question_id: q2.id)

    qMvM = Question.create(answer: "Major(M)", level_id: new_user_level.id, note: JSON.unparse(note[0]), multipleChoice: JSON.unparse(mvmanswers) )
    QuestionTag.create(tag_id: tag3.id, question_id: qMvM.id )
    QuestionTag.create(tag_id: major.id, question_id: qMvM.id )

end
arr3.each do |note|
    arr = multipleSelector(multiChords, note[1], 4)

    q2 = Question.create(answer: note[1], level_id: new_user_level.id, note: JSON.unparse(note[0]), multipleChoice: JSON.unparse(arr))

    question_tag3 = QuestionTag.create(tag_id: tag3.id, question_id: q2.id )
    question_tag2 = QuestionTag.create(tag_id: major.id, question_id: q2.id )
    t = Tag.find_by(name: note[1][0])
    QuestionTag.create(tag_id: t.id, question_id: q2.id)

    qMvM = Question.create(answer: "Major(M)", level_id: new_user_level.id, note: JSON.unparse(note[0]), multipleChoice: JSON.unparse(mvmanswers) )
    QuestionTag.create(tag_id: tag3.id, question_id: qMvM.id )
    QuestionTag.create(tag_id: major.id, question_id: qMvM.id )

end

arr4 = [[["ab2", "b3", "eb3"],"abm"], [["a2", "c3", "e3"],"am"], [["bb2","db3", "f3"],"bbm"], [["b2","d3", "f#3"],"bm"], [["c3", "eb3", "g3"],"cm"], [["c#3", "e3", "g#3"],"c#M"], [["d3", "f3", "a3"],"dm"], [["eb3", "gb3", "bb3"],"ebm"], [["e3", "g3", "b3"],"em"], [["f3", "ab3", "c4"],"fM"], [["f#3", "a3", "c#4"],"f#m"], [["g3", "bb3", "d4"],"gm"]]
arr5 = [[["ab3", "b4", "eb4"],"abm"], [["a3", "c4", "e4"],"am"], [["bb3","db4", "f4"],"bbm"], [["b3","d4", "f#4"],"bm"], [["c4", "eb4", "g4"],"cm"], [["c#4", "e4", "g#4"],"c#M"], [["d4", "f4", "a4"],"dm"], [["eb4", "gb4", "bb4"],"ebm"], [["e4", "g4", "b4"],"em"], [["f4", "ab4", "c5"],"fM"], [["f#4", "a4", "c#5"],"f#m"], [["g4", "bb4", "d5"],"gm"]]
arr6 = [[["ab4", "b5", "eb5"],"abm"], [["a4", "c5", "e5"],"am"], [["bb4","db5", "f5"],"bbm"], [["b4","d5", "f#5"],"bm"], [["c5", "eb5", "g5"],"cm"], [["c#5", "e5", "g#5"],"c#M"], [["d5", "f5", "a5"],"dm"], [["eb5", "gb5", "bb5"],"ebm"], [["e5", "g5", "b5"],"em"], [["f5", "ab5", "c6"],"fM"], [["f#5", "a5", "c#6"],"f#m"], [["g5", "bb5", "d6"],"gm"]]

arr4.each do |note|
    arr = multipleSelector(multiChords, note[1], 4)

    q2 = Question.create(answer: note[1], level_id: new_user_level.id, note: JSON.unparse(note[0]), multipleChoice: JSON.unparse(arr) )

    QuestionTag.create(tag_id: tag3.id, question_id: q2.id )
    QuestionTag.create(tag_id: minor.id, question_id: q2.id )
    t = Tag.find_by(name: note[1][0])
    QuestionTag.create(tag_id: t.id, question_id: q2.id)

    qMvM = Question.create(answer: "minor(m)", level_id: new_user_level.id, note: JSON.unparse(note[0]), multipleChoice: JSON.unparse(mvmanswers) )
    QuestionTag.create(tag_id: tag3.id, question_id: qMvM.id )
    QuestionTag.create(tag_id: minor.id, question_id: qMvM.id )
end
arr5.each do |note|
    arr = multipleSelector(multiChords, note[1], 4)

    q2 = Question.create(answer: note[1], level_id: new_user_level.id, note: JSON.unparse(note[0]), multipleChoice: JSON.unparse(arr))

    QuestionTag.create(tag_id: tag3.id, question_id: q2.id )
    QuestionTag.create(tag_id: minor.id, question_id: q2.id )
    t = Tag.find_by(name: note[1][0])
    QuestionTag.create(tag_id: t.id, question_id: q2.id)

    qMvM = Question.create(answer: "minor(m)", level_id: new_user_level.id, note: JSON.unparse(note[0]), multipleChoice: JSON.unparse(mvmanswers) )
    QuestionTag.create(tag_id: tag3.id, question_id: qMvM.id )
    QuestionTag.create(tag_id: minor.id, question_id: qMvM.id )
end
arr6.each do |note|
    arr = multipleSelector(multiChords, note[1], 4)

    q2 = Question.create(answer: note[1], level_id: new_user_level.id, note: JSON.unparse(note[0]), multipleChoice: JSON.unparse(arr))

    QuestionTag.create(tag_id: tag3.id, question_id: q2.id )
    QuestionTag.create(tag_id: minor.id, question_id: q2.id )
    t = Tag.find_by(name: note[1][0])
    QuestionTag.create(tag_id: t.id, question_id: q2.id)

    qMvM = Question.create(answer: "minor(m)", level_id: new_user_level.id, note: JSON.unparse(note[0]), multipleChoice: JSON.unparse(mvmanswers) )
    QuestionTag.create(tag_id: tag3.id, question_id: qMvM.id )
    QuestionTag.create(tag_id: minor.id, question_id: qMvM.id )

end

arr = multipleSelector(multi_note, "c", 4)

q = Question.create(answer: "c", level_id: new_user_level.id, note: JSON.unparse(["c4", "d4", "e4", "f4", "g4", "a4", "b4", "c5"]), multipleChoice: JSON.unparse(arr))
t = Tag.create(name: "scales")
QuestionTag.create(tag_id: t.id, question_id: q.id )
