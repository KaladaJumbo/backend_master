class QuestionsController < ApplicationController

    def show
    end

    def random10
        rand10_arr = Question.random10

        rand10_arr.each do |question|
            puts "note"
            puts question.note
            puts "multiple choice"
            puts question.multipleChoice
            question.note = JSON.parse(question.note)
            question.multipleChoice = JSON.parse(question.multipleChoice)
        end
        

        render json: rand10_arr.to_json()
    end
end
