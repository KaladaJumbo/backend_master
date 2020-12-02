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

user1 = User.create(username: "test", level_id: new_user_level.id, password: "test", points: 30)

multi_note = ["a","b","c","d","e","f","g"]

#universal tags
multi_note.each {|note| Tag.create(name: note, tip: "Practice makes perfect. It is very hard to discern notes")}
tag2 = Tag.create(name: "notes", tip: "Learn a couple notes and associate every other note the few learned")
tag3 = Tag.create(name: "chords", tip: "Listen to the lowest note as a clue to the possible chord")
scales = Tag.create(name: "scales", tip: "The first note is always a dead giveaway")
major = Tag.create(name: "major", tip: "Third note in the scale will sound in sync with the first note")
minor = Tag.create(name: "minor", tip: "Third note is flattened")
majorvsminor = Tag.create(name: "major vs minor", tip: "Major sounds happier vs their minor counterparts")
pro = Tag.create(name: "progressions", tip: "Try to listen to the resolution, it will hint to the possible type of progression")


#question creation 

arr1 = ["a3", "b3", "c3", "d3", "e3", "f3", "g3"]
arr2 = ["a4", "b4", "c4", "d4", "e4", "f4", "g4"]
arr3 = ["a5", "b5", "c5", "d5", "e5", "f5", "g5"]

#notes
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

#chords

arr1 = [[["ab2", "c3", "eb3"],"abM"], [["a2", "c#3", "e3"],"aM"], [["bb2","d3", "f3"],"bbM"], [["b2","d#3", "f#3"],"bM"], [["cb3", "eb3", "gb3"],"cbM"], [["c3", "e3", "g3"],"cM"], [["c#3", "e#3", "g#3"],"c#M"], [["db3", "f3", "ab3"],"dbM"], [["d3", "f#3", "a3"],"dM"], [["eb3", "g3", "bb3"],"ebM"], [["e3", "g#3", "b3"],"eM"], [["fb3", "ab3", "cb4"],"fbM"], [["f3", "a3", "c4"],"fM"], [["f#3", "a#3", "c#4"],"f#M"], [["gb3", "bb3", "db4"],"gbM"],[["g3", "b3", "d4"],"gM"],[["g#3", "b#3", "d#4"],"g#M"]]
arr2 = [[["ab3", "c4", "eb4"],"abM"], [["a3", "c#4", "e4"],"aM"], [["bb3","d4", "f4"],"bbM"], [["b3","d#4", "f#4"],"bM"], [["cb4", "eb4", "gb4"],"cbM"], [["c4", "e4", "g4"],"cM"], [["c#4", "e#4", "g#4"],"c#M"], [["db4", "f4", "ab4"],"dbM"], [["d4", "f#4", "a4"],"dM"], [["eb4", "g4", "bb4"],"ebM"], [["e4", "g#4", "b4"],"eM"], [["fb4", "ab4", "cb5"],"fbM"], [["f4", "a4", "c5"],"fM"], [["f#4", "a#4", "c#5"],"f#M"], [["gb4", "bb4", "db5"],"gbM"],[["g4", "b4", "d5"],"gM"],[["g#4", "b#4", "d#5"],"g#M"]]
arr3 = [[["ab4", "c5", "eb5"],"abM"], [["a4", "c#5", "e5"],"aM"], [["bb4","d5", "f5"],"bbM"], [["b4","d#5", "f#5"],"bM"], [["cb5", "eb5", "gb5"],"cbM"], [["c5", "e5", "g5"],"cM"], [["c#5", "e#5", "g#5"],"c#M"], [["db5", "f5", "ab5"],"dbM"], [["d5", "f#5", "a5"],"dM"], [["eb5", "g5", "bb5"],"ebM"], [["e5", "g#5", "b5"],"eM"], [["fb5", "ab5", "cb6"],"fbM"], [["f5", "a5", "c6"],"fM"], [["f#5", "a#5", "c#6"],"f#M"], [["gb5", "bb5", "db6"],"gbM"],[["g5", "b5", "d6"],"gM"],[["g#5", "b#5", "d#6"],"g#M"]]

multiChords = ["aM", "abM", "bbM", "bM", "cbM", "cM", "c#M", "dbM", "dM", "ebM", "eM", "fbM", "fM", "f#M", "gbM", "gM", "g#M", "am", "abm", "bbm", "bm", "cm", "c#m", "dm", "ebm", "em", "fm", "f#m", "gm"]
mvmanswers = ["Major(M)", "Minor(m)"]
maj_ans = "Major(M)"
min_ans = "Minor(m)"

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

#scales
major_multi_scale = ["cM", "c#M", "dM", "d#M", "eM", "fM", "f#M", "gM", "g#M", "aM", "a#M", "bM", "cm", "c#m", "dm", "d#m", "em", "fm", "f#m", "gm", "g#m", "am", "a#m", "bm"]
arr = multipleSelector(major_multi_scale, "cM", 4)

q = Question.create(answer: "cM", level_id: new_user_level.id, note: JSON.unparse(["c4", "d4", "e4", "f4", "g4", "a4", "b4", "c5"]), multipleChoice: JSON.unparse(arr), qtype: "i")
q2 = Question.create(answer: "cM", level_id: new_user_level.id, note: JSON.unparse(["c3", "d3", "e3", "f3", "g3", "a3", "b3", "c4"]), multipleChoice: JSON.unparse(arr), qtype: "i")
q3 = Question.create(answer: "cM", level_id: new_user_level.id, note: JSON.unparse(["c2", "d2", "e2", "f2", "g2", "a2", "b2", "c3"]), multipleChoice: JSON.unparse(arr), qtype: "i")
QuestionTag.create(tag_id: scales.id, question_id: q.id )
QuestionTag.create(tag_id: scales.id, question_id: q2.id )
QuestionTag.create(tag_id: scales.id, question_id: q3.id )
QuestionTag.create(tag_id: major.id, question_id: q.id )
QuestionTag.create(tag_id: major.id, question_id: q2.id )
QuestionTag.create(tag_id: major.id, question_id: q3.id )

qMvM = Question.create(answer: maj_ans, level_id: new_user_level.id, note: JSON.unparse(["c2", "d2", "e2", "f2", "g2", "a2", "b2", "c3"]), multipleChoice: JSON.unparse(mvmanswers), qtype: "i" )
QuestionTag.create(tag_id: scales.id, question_id: qMvM.id )
QuestionTag.create(tag_id: major.id, question_id: qMvM.id )
QuestionTag.create(tag_id: majorvsminor.id, question_id: qMvM.id )


arr = multipleSelector(major_multi_scale, "c#M", 4)

q = Question.create(answer: "c#M", level_id: new_user_level.id, note: JSON.unparse(["C#4", "D#4", "F4", "F#4", "G#4", "A#4", "B#4", "C#5"]), multipleChoice: JSON.unparse(arr), qtype: "i")
q2 = Question.create(answer: "c#M", level_id: new_user_level.id, note: JSON.unparse(["C#3", "D#3", "F3", "F#3", "G#3", "A#3", "B#3", "C#4"]), multipleChoice: JSON.unparse(arr), qtype: "i")
q3 = Question.create(answer: "c#M", level_id: new_user_level.id, note: JSON.unparse(["C#2", "D#2", "F2", "F#2", "G#2", "A#2", "B#2", "C#3"]), multipleChoice: JSON.unparse(arr), qtype: "i")
QuestionTag.create(tag_id: scales.id, question_id: q.id )
QuestionTag.create(tag_id: scales.id, question_id: q2.id )
QuestionTag.create(tag_id: scales.id, question_id: q3.id )
QuestionTag.create(tag_id: major.id, question_id: q.id )
QuestionTag.create(tag_id: major.id, question_id: q2.id )
QuestionTag.create(tag_id: major.id, question_id: q3.id )

qMvM = Question.create(answer: maj_ans, level_id: new_user_level.id, note: JSON.unparse(["C#2", "D#2", "F2", "F#2", "G#2", "A#2", "B#2", "C#3"]), multipleChoice: JSON.unparse(mvmanswers), qtype: "i" )
QuestionTag.create(tag_id: scales.id, question_id: qMvM.id )
QuestionTag.create(tag_id: major.id, question_id: qMvM.id )
QuestionTag.create(tag_id: majorvsminor.id, question_id: qMvM.id )


arr = multipleSelector(major_multi_scale, "dM", 4)

q = Question.create(answer: "dM", level_id: new_user_level.id, note: JSON.unparse(["D4", "E4", "F#4", "G4", "A4", "B4", "C#5", "D5"]), multipleChoice: JSON.unparse(arr), qtype: "i")
q2 = Question.create(answer: "dM", level_id: new_user_level.id, note: JSON.unparse(["D3", "E3", "F#3", "G3", "A3", "B3", "C#4", "D4"]), multipleChoice: JSON.unparse(arr), qtype: "i")
q3 = Question.create(answer: "dM", level_id: new_user_level.id, note: JSON.unparse(["D2", "E2", "F#2", "G2", "A2", "B2", "C#3", "D3"]), multipleChoice: JSON.unparse(arr), qtype: "i")
QuestionTag.create(tag_id: scales.id, question_id: q.id )
QuestionTag.create(tag_id: scales.id, question_id: q2.id )
QuestionTag.create(tag_id: scales.id, question_id: q3.id )
QuestionTag.create(tag_id: major.id, question_id: q.id )
QuestionTag.create(tag_id: major.id, question_id: q2.id )
QuestionTag.create(tag_id: major.id, question_id: q3.id )

qMvM = Question.create(answer: maj_ans, level_id: new_user_level.id, note: JSON.unparse(["D2", "E2", "F#2", "G2", "A2", "B2", "C#3", "D3"]), multipleChoice: JSON.unparse(mvmanswers), qtype: "i" )
QuestionTag.create(tag_id: scales.id, question_id: qMvM.id )
QuestionTag.create(tag_id: major.id, question_id: qMvM.id )
QuestionTag.create(tag_id: majorvsminor.id, question_id: qMvM.id )


arr = multipleSelector(major_multi_scale, "d#M", 4)

q = Question.create(answer: "d#M", level_id: new_user_level.id, note: JSON.unparse(["D#4", "F4", "G4", "G#4", "A#4", "C5", "D5", "D#5"]), multipleChoice: JSON.unparse(arr), qtype: "i")
q2 = Question.create(answer: "d#M", level_id: new_user_level.id, note: JSON.unparse(["D#3", "F3", "G3", "G#3", "A#3", "C4", "D4", "D#4"]), multipleChoice: JSON.unparse(arr), qtype: "i")
q3 = Question.create(answer: "d#M", level_id: new_user_level.id, note: JSON.unparse(["D#2", "F2", "G2", "G#2", "A#2", "C3", "D3", "D#3"]), multipleChoice: JSON.unparse(arr), qtype: "i")
QuestionTag.create(tag_id: scales.id, question_id: q.id )
QuestionTag.create(tag_id: scales.id, question_id: q2.id )
QuestionTag.create(tag_id: scales.id, question_id: q3.id )
QuestionTag.create(tag_id: major.id, question_id: q.id )
QuestionTag.create(tag_id: major.id, question_id: q2.id )
QuestionTag.create(tag_id: major.id, question_id: q3.id )

qMvM = Question.create(answer: maj_ans, level_id: new_user_level.id, note: JSON.unparse(["D#2", "F2", "G2", "G#2", "A#2", "C3", "D3", "D#3"]), multipleChoice: JSON.unparse(mvmanswers), qtype: "i" )
QuestionTag.create(tag_id: scales.id, question_id: qMvM.id )
QuestionTag.create(tag_id: major.id, question_id: qMvM.id )
QuestionTag.create(tag_id: majorvsminor.id, question_id: qMvM.id )


arr = multipleSelector(major_multi_scale, "eM", 4)

q = Question.create(answer: "eM", level_id: new_user_level.id, note: JSON.unparse(["E4", "F#4", "G#4", "A4", "B4", "C#5", "D#5", "E5"]), multipleChoice: JSON.unparse(arr), qtype: "i")
q2 = Question.create(answer: "eM", level_id: new_user_level.id, note: JSON.unparse(["E3", "F#3", "G#3", "A3", "B3", "C#4", "D#4", "E4"]), multipleChoice: JSON.unparse(arr), qtype: "i")
q3 = Question.create(answer: "eM", level_id: new_user_level.id, note: JSON.unparse(["E2", "F#2", "G#2", "A2", "B2", "C#3", "D#3", "E3"]), multipleChoice: JSON.unparse(arr), qtype: "i")
QuestionTag.create(tag_id: scales.id, question_id: q.id )
QuestionTag.create(tag_id: scales.id, question_id: q2.id )
QuestionTag.create(tag_id: scales.id, question_id: q3.id )
QuestionTag.create(tag_id: major.id, question_id: q.id )
QuestionTag.create(tag_id: major.id, question_id: q2.id )
QuestionTag.create(tag_id: major.id, question_id: q3.id )

qMvM = Question.create(answer: maj_ans, level_id: new_user_level.id, note: JSON.unparse(["E2", "F#2", "G#2", "A2", "B2", "C#3", "D#3", "E3"]), multipleChoice: JSON.unparse(mvmanswers) )
QuestionTag.create(tag_id: scales.id, question_id: qMvM.id )
QuestionTag.create(tag_id: major.id, question_id: qMvM.id )
QuestionTag.create(tag_id: majorvsminor.id, question_id: qMvM.id )

arr = multipleSelector(major_multi_scale, "fM", 4)

q = Question.create(answer: "fM", level_id: new_user_level.id, note: JSON.unparse(["F4", "G4", "A4", "Bb4", "C5", "D5", "E5", "F5"]), multipleChoice: JSON.unparse(arr), qtype: "i")
q2 = Question.create(answer: "fM", level_id: new_user_level.id, note: JSON.unparse(["F3", "G3", "A3", "Bb3", "C4", "D4", "E4", "F4"]), multipleChoice: JSON.unparse(arr), qtype: "i")
q3 = Question.create(answer: "fM", level_id: new_user_level.id, note: JSON.unparse(["F2", "G2", "A2", "Bb2", "C3", "D3", "E3", "F3"]), multipleChoice: JSON.unparse(arr), qtype: "i")
QuestionTag.create(tag_id: scales.id, question_id: q.id )
QuestionTag.create(tag_id: scales.id, question_id: q2.id )
QuestionTag.create(tag_id: scales.id, question_id: q3.id )
QuestionTag.create(tag_id: major.id, question_id: q.id )
QuestionTag.create(tag_id: major.id, question_id: q2.id )
QuestionTag.create(tag_id: major.id, question_id: q3.id )

qMvM = Question.create(answer: maj_ans, level_id: new_user_level.id, note: JSON.unparse(["F2", "G2", "A2", "Bb2", "C3", "D3", "E3", "F3"]), multipleChoice: JSON.unparse(mvmanswers), qtype: "i" )
QuestionTag.create(tag_id: scales.id, question_id: qMvM.id )
QuestionTag.create(tag_id: major.id, question_id: qMvM.id )
QuestionTag.create(tag_id: majorvsminor.id, question_id: qMvM.id )


arr = multipleSelector(major_multi_scale, "f#M", 4)

q = Question.create(answer: "f#M", level_id: new_user_level.id, note: JSON.unparse(["F#4", "G#4", "A#4", "B4", "C#5", "D#5", "E#5", "F#5"]), multipleChoice: JSON.unparse(arr), qtype: "i")
q2 = Question.create(answer: "f#M", level_id: new_user_level.id, note: JSON.unparse(["F#3", "G#3", "A#3", "B3", "C#4", "D#4", "E#4", "F#4"]), multipleChoice: JSON.unparse(arr), qtype: "i")
q3 = Question.create(answer: "f#M", level_id: new_user_level.id, note: JSON.unparse(["F#2", "G#2", "A#2", "B2", "C#3", "D#3", "E#3", "F#3"]), multipleChoice: JSON.unparse(arr), qtype: "i")
QuestionTag.create(tag_id: scales.id, question_id: q.id )
QuestionTag.create(tag_id: scales.id, question_id: q2.id )
QuestionTag.create(tag_id: scales.id, question_id: q3.id )
QuestionTag.create(tag_id: major.id, question_id: q.id )
QuestionTag.create(tag_id: major.id, question_id: q2.id )
QuestionTag.create(tag_id: major.id, question_id: q3.id )

qMvM = Question.create(answer: maj_ans, level_id: new_user_level.id, note: JSON.unparse(["F#2", "G#2", "A#2", "B2", "C#3", "D#3", "E#3", "F#3"]), multipleChoice: JSON.unparse(mvmanswers), qtype: "i" )
QuestionTag.create(tag_id: scales.id, question_id: qMvM.id )
QuestionTag.create(tag_id: major.id, question_id: qMvM.id )
QuestionTag.create(tag_id: majorvsminor.id, question_id: qMvM.id )


arr = multipleSelector(major_multi_scale, "gM", 4)

q = Question.create(answer: "gM", level_id: new_user_level.id, note: JSON.unparse(["G4", "A4", "B4", "C5", "D5", "E5", "F#5", "G5"]), multipleChoice: JSON.unparse(arr), qtype: "i")
q2 = Question.create(answer: "gM", level_id: new_user_level.id, note: JSON.unparse(["G3", "A3", "B3", "C4", "D4", "E4", "F#4", "G4"]), multipleChoice: JSON.unparse(arr), qtype: "i")
q3 = Question.create(answer: "gM", level_id: new_user_level.id, note: JSON.unparse(["G2", "A2", "B2", "C3", "D3", "E3", "F#3", "G3"]), multipleChoice: JSON.unparse(arr), qtype: "i")
QuestionTag.create(tag_id: scales.id, question_id: q.id )
QuestionTag.create(tag_id: scales.id, question_id: q2.id )
QuestionTag.create(tag_id: scales.id, question_id: q3.id )
QuestionTag.create(tag_id: major.id, question_id: q.id )
QuestionTag.create(tag_id: major.id, question_id: q2.id )
QuestionTag.create(tag_id: major.id, question_id: q3.id )

qMvM = Question.create(answer: maj_ans, level_id: new_user_level.id, note: JSON.unparse(["G2", "A2", "B2", "C3", "D3", "E3", "F#3", "G3"]), multipleChoice: JSON.unparse(mvmanswers), qtype: "i" )
QuestionTag.create(tag_id: scales.id, question_id: qMvM.id )
QuestionTag.create(tag_id: major.id, question_id: qMvM.id )
QuestionTag.create(tag_id: majorvsminor.id, question_id: qMvM.id )


arr = multipleSelector(major_multi_scale, "g#M", 4)

q = Question.create(answer: "g#M", level_id: new_user_level.id, note: JSON.unparse(["G#4", "A#4", "B#4", "C#5", "D#5", "E#5", "G5", "G#5"]), multipleChoice: JSON.unparse(arr), qtype: "i")
q2 = Question.create(answer: "g#M", level_id: new_user_level.id, note: JSON.unparse(["G#3", "A#3", "B#3", "C#4", "D#4", "E#4", "G4", "G#4"]), multipleChoice: JSON.unparse(arr), qtype: "i")
q3 = Question.create(answer: "g#M", level_id: new_user_level.id, note: JSON.unparse(["G#2", "A#2", "B#2", "C#3", "D#3", "E#3", "G3", "G#3"]), multipleChoice: JSON.unparse(arr), qtype: "i")
QuestionTag.create(tag_id: scales.id, question_id: q.id )
QuestionTag.create(tag_id: scales.id, question_id: q2.id )
QuestionTag.create(tag_id: scales.id, question_id: q3.id )
QuestionTag.create(tag_id: major.id, question_id: q.id )
QuestionTag.create(tag_id: major.id, question_id: q2.id )
QuestionTag.create(tag_id: major.id, question_id: q3.id )

qMvM = Question.create(answer: maj_ans, level_id: new_user_level.id, note: JSON.unparse(["G#2", "A#2", "B#2", "C#3", "D#3", "E#3", "G3", "G#3"]), multipleChoice: JSON.unparse(mvmanswers), qtype: "i" )
QuestionTag.create(tag_id: scales.id, question_id: qMvM.id )
QuestionTag.create(tag_id: major.id, question_id: qMvM.id )
QuestionTag.create(tag_id: majorvsminor.id, question_id: qMvM.id )


arr = multipleSelector(major_multi_scale, "aM", 4)

q = Question.create(answer: "aM", level_id: new_user_level.id, note: JSON.unparse(["A4", "B4", "C#5", "D5", "E5", "F#5", "G#5", "A5"]), multipleChoice: JSON.unparse(arr), qtype: "i")
q2 = Question.create(answer: "aM", level_id: new_user_level.id, note: JSON.unparse(["A3", "B3", "C#4", "D4", "E4", "F#4", "G#4", "A4"]), multipleChoice: JSON.unparse(arr), qtype: "i")
q3 = Question.create(answer: "aM", level_id: new_user_level.id, note: JSON.unparse(["A2", "B2", "C#3", "D3", "E3", "F#3", "G#3", "A3"]), multipleChoice: JSON.unparse(arr), qtype: "i")
QuestionTag.create(tag_id: scales.id, question_id: q.id )
QuestionTag.create(tag_id: scales.id, question_id: q2.id )
QuestionTag.create(tag_id: scales.id, question_id: q3.id )
QuestionTag.create(tag_id: major.id, question_id: q.id )
QuestionTag.create(tag_id: major.id, question_id: q2.id )
QuestionTag.create(tag_id: major.id, question_id: q3.id )

qMvM = Question.create(answer: maj_ans, level_id: new_user_level.id, note: JSON.unparse(["A2", "B2", "C#3", "D3", "E3", "F#3", "G#3", "A3"]), multipleChoice: JSON.unparse(mvmanswers), qtype: "i" )
QuestionTag.create(tag_id: scales.id, question_id: qMvM.id )
QuestionTag.create(tag_id: major.id, question_id: qMvM.id )
QuestionTag.create(tag_id: majorvsminor.id, question_id: qMvM.id )


arr = multipleSelector(major_multi_scale, "a#M", 4)

q = Question.create(answer: "a#M", level_id: new_user_level.id, note: JSON.unparse(["A#4", "C5", "D5", "D#5", "F5", "G5", "A5", "A#5"]), multipleChoice: JSON.unparse(arr), qtype: "i")
q2 = Question.create(answer: "a#M", level_id: new_user_level.id, note: JSON.unparse(["A#3", "C4", "D4", "D#4", "F4", "G4", "A4", "A#4"]), multipleChoice: JSON.unparse(arr), qtype: "i")
q3 = Question.create(answer: "a#M", level_id: new_user_level.id, note: JSON.unparse(["A#2", "C3", "D3", "D#3", "F3", "G3", "A3", "A#3"]), multipleChoice: JSON.unparse(arr), qtype: "i")
QuestionTag.create(tag_id: scales.id, question_id: q.id )
QuestionTag.create(tag_id: scales.id, question_id: q2.id )
QuestionTag.create(tag_id: scales.id, question_id: q3.id )
QuestionTag.create(tag_id: major.id, question_id: q.id )
QuestionTag.create(tag_id: major.id, question_id: q2.id )
QuestionTag.create(tag_id: major.id, question_id: q3.id )

qMvM = Question.create(answer: maj_ans, level_id: new_user_level.id, note: JSON.unparse(["A#2", "C3", "D3", "D#3", "F3", "G3", "A3", "A#3"]), multipleChoice: JSON.unparse(mvmanswers), qtype: "i" )
QuestionTag.create(tag_id: scales.id, question_id: qMvM.id )
QuestionTag.create(tag_id: major.id, question_id: qMvM.id )
QuestionTag.create(tag_id: majorvsminor.id, question_id: qMvM.id )


arr = multipleSelector(major_multi_scale, "bM", 4)

q = Question.create(answer: "bM", level_id: new_user_level.id, note: JSON.unparse(["B4", "C#5", "D#5", "E5", "F#5", "G#5", "A#5", "B5"]), multipleChoice: JSON.unparse(arr), qtype: "i")
q2 = Question.create(answer: "bM", level_id: new_user_level.id, note: JSON.unparse(["B3", "C#4", "D#4", "E4", "F#4", "G#4", "A#4", "B4"]), multipleChoice: JSON.unparse(arr), qtype: "i")
q3 = Question.create(answer: "bM", level_id: new_user_level.id, note: JSON.unparse(["B2", "C#3", "D#3", "E3", "F#3", "G#3", "A#3", "B3"]), multipleChoice: JSON.unparse(arr), qtype: "i")
QuestionTag.create(tag_id: scales.id, question_id: q.id )
QuestionTag.create(tag_id: scales.id, question_id: q2.id )
QuestionTag.create(tag_id: scales.id, question_id: q3.id )
QuestionTag.create(tag_id: major.id, question_id: q.id )
QuestionTag.create(tag_id: major.id, question_id: q2.id )
QuestionTag.create(tag_id: major.id, question_id: q3.id )

qMvM = Question.create(answer: maj_ans, level_id: new_user_level.id, note: JSON.unparse(["A#2", "C3", "D3", "D#3", "F3", "G3", "A3", "A#3"]), multipleChoice: JSON.unparse(mvmanswers), qtype: "i" )
QuestionTag.create(tag_id: scales.id, question_id: qMvM.id )
QuestionTag.create(tag_id: major.id, question_id: qMvM.id )
QuestionTag.create(tag_id: majorvsminor.id, question_id: qMvM.id )

#minor scales


# #minor
#i do not think this method is faster than the copy and paste method above unless a more dynamic 
#way to make the data is written
data = [
    ["Am",["A4", "B4", "C5", "D5", "E5", "F5", "G5", "A5"]],
    ["Am",["A3", "B3", "C4", "D4", "E4", "F4", "G4", "A4"]],
    ["Am",["A2", "B2", "C3", "D3", "E3", "F3", "G3", "A3"]],
    ["A#m",["A#4", "B#4", "C#5", "D#5", "F5", "F#5", "G#5", "A#5"]], 
    ["A#m",["A#3", "B#3", "C#4", "D#4", "F4", "F#4", "G#4", "A#4"]], 
    ["A#m",["A#2", "B#2", "C#3", "D#3", "F3", "F#3", "G#3", "A#3"]], 
    ["Bm",["B4", "C#5", "D5", "E5", "F#5", "G5", "A5", "B5"]],
    ["Bm",["B3", "C#4", "D4", "E4", "F#4", "G4", "A4", "B4"]],
    ["Bm",["B2", "C#3", "D3", "E3", "F#3", "G3", "A3", "B3"]],
    ["Cm",["C4", "D4", "Eb4", "F4", "G4", "Ab4", "Bb4", "C5"]],
    ["Cm",["C3", "D3", "Eb3", "F3", "G3", "Ab3", "Bb3", "C4"]],
    ["Cm",["C2", "D2", "Eb2", "F2", "G2", "Ab2", "Bb2", "C3"]],
    ["C#m",["C#4", "D#4", "E4", "F#4", "G#4", "A4", "B4", "C#5"]],
    ["C#m",["C#3", "D#3", "E3", "F#3", "G#3", "A3", "B3", "C#4"]],
    ["C#m",["C#2", "D#2", "E2", "F#2", "G#2", "A2", "B2", "C#3"]],
    ["Dm",["D4", "E4", "F4", "G4", "A4", "Bb4", "C5", "D5"]],
    ["Dm",["D3", "E3", "F3", "G3", "A3", "Bb3", "C4", "D4"]],
    ["Dm",["D2", "E2", "F2", "G2", "A2", "Bb2", "C3", "D3"]],
    ["D#m",["D#4", "F4", "F#4", "G#4", "A#4", "B4", "C#5", "D#5"]], 
    ["D#m",["D#3", "F3", "F#3", "G#3", "A#3", "B3", "C#4", "D#4"]],
    ["D#m",["D#2", "F2", "F#2", "G#2", "A#2", "B2", "C#3", "D#3"]],
    ["Em",["E4", "F#4", "G4", "A4", "B4", "C5", "D5", "E5"]],
    ["Em",["E3", "F#3", "G3", "A3", "B3", "C4", "D4", "E4"]],
    ["Em",["E2", "F#2", "G2", "A2", "B2", "C3", "D3", "E3"]],
    ["Fm",["F4", "G4", "Ab4", "Bb4", "C5", "Db5", "Eb5", "F5"]],
    ["Fm",["F3", "G3", "Ab3", "Bb3", "C4", "Db4", "Eb4", "F4"]],
    ["Fm",["F2", "G2", "Ab2", "Bb2", "C3", "Db3", "Eb3", "F3"]],
    ["F#m",["F#4", "G#4", "A4", "B4", "C#5", "D5", "E5", "F#5"]],
    ["F#m",["F#3", "G#3", "A3", "B3", "C#4", "D4", "E4", "F#4"]], 
    ["F#m",["F#2", "G#2", "A2", "B2", "C#3", "D3", "E3", "F#3"]], 
    ["Gm",["G4", "A4", "Bb4", "C5", "D5", "Eb5", "F5", "G5"]],
    ["Gm",["G3", "A3", "Bb3", "C4", "D4", "Eb4", "F4", "G4"]],
    ["Gm",["G2", "A2", "Bb2", "C3", "D3", "Eb3", "F3", "G3"]],
    ["G#m",["G#4", "A#4", "B4", "C#5", "D#5", "E5", "F#5", "G#5"]], 
    ["G#m",["G#3", "A#3", "B3", "C#4", "D#4", "E4", "F#4", "G#4"]],
    ["G#m",["G#2", "A#2", "B2", "C#3", "D#3", "E3", "F#3", "G#3"]]
] 


# def minor_scale_maker3000(scale)
#     major_multi_scale = ["c", "c#", "d", "d#", "e", "f", "f#", "g", "g#", "a", "a#", "b"]
#     arr = multipleSelector(major_multi_scale, scale[0], 4)

#     q = Question.create(answer: scale[0], level_id: new_user_level.id, note: JSON.unparse(scale[1]), multipleChoice: JSON.unparse(arr))
#     QuestionTag.create(tag_id: scales.id, question_id: q.id )
#     QuestionTag.create(tag_id: minor.id, question_id: q.id )
    

#     qMvM = Question.create(answer: min_ans, level_id: new_user_level.id, note: JSON.unparse(scale[1]), multipleChoice: JSON.unparse(mvmanswers) )
#     QuestionTag.create(tag_id: scales.id, question_id: qMvM.id )
#     QuestionTag.create(tag_id: minor.id, question_id: qMvM.id )
#     QuestionTag.create(tag_id: majorvsminor.id, question_id: qMvM.id )
# end

data.each do |scale| 
    arr = multipleSelector(major_multi_scale, scale[0], 4)

    q = Question.create(answer: scale[0], level_id: new_user_level.id, note: JSON.unparse(scale[1]), multipleChoice: JSON.unparse(arr), qtype: "i")
    QuestionTag.create(tag_id: scales.id, question_id: q.id )
    QuestionTag.create(tag_id: minor.id, question_id: q.id )
    

    qMvM = Question.create(answer: min_ans, level_id: new_user_level.id, note: JSON.unparse(scale[1]), multipleChoice: JSON.unparse(mvmanswers), qtype: "i" )
    QuestionTag.create(tag_id: scales.id, question_id: qMvM.id )
    QuestionTag.create(tag_id: minor.id, question_id: qMvM.id )
    QuestionTag.create(tag_id: majorvsminor.id, question_id: qMvM.id )
end

#chord progressions

data = [
    [["D3", "F3", "A3", "c4"], ["G3", "B3", "D4", "f4"], ["c3", "e3", "g3", "b3"]]
]

pro_ans = ["1-4-5", "1-6-4-5", "2-5-1"]

data.each do |progression|
    q = Question.create(answer: "2-5-1", level_id: new_user_level.id, note: JSON.unparse(progression), multipleChoice: JSON.unparse(pro_ans), qtype: "i")
    QuestionTag.create(tag_id: pro.id, question_id: q.id )
end