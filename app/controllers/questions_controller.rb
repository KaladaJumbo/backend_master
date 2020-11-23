class QuestionsController < ApplicationController

    def show
    end
    
    def random10
        rand10_arr = Question.random10
        render json: rand10_arr.to_json()
    end
end
