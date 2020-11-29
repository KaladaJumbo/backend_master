class QuestionsController < ApplicationController

    def show
    end

    def random10
        rand10_arr = Question.random10

        rand10_arr.each do |question|
            question.note = JSON.parse(question.note)
            question.multipleChoice = JSON.parse(question.multipleChoice)
        end
        

        render json: rand10_arr.to_json()
    end

    def random_chords
        rand10_arr = Question.random_chords

        rand10_arr.each do |question|
            question.note = JSON.parse(question.note)
            question.multipleChoice = JSON.parse(question.multipleChoice)
        end
        

        render json: rand10_arr.to_json()
    end

    def random_custom
        rand10_arr = Question.random_custom(params[:tag])

        rand10_arr.each do |question|
            question.note = JSON.parse(question.note)
            question.multipleChoice = JSON.parse(question.multipleChoice)
        end
        

        render json: rand10_arr.to_json()
    end
end
