class TagsController < ApplicationController

    def create 
        arr = []
        params[:wrongAnswers].each {|ans| UserQuestion.create(question_id: ans, user_id: params[:user])}

        arr = User.find(params[:user]).weaknesses

        render json: {
            auth: true,
            tags: arr,
        }
        
    end
end
