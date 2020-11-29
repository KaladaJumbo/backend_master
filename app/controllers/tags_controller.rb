class TagsController < ApplicationController

    def create 
        arr = []
        params[:wrongAnswers].each {|ans| UserQuestion.create(question_id: ans, user_id: params[:user])}
        user = User.find(params[:user])
        arr = user.weaknesses

        render json: {
            auth: true,
            user: user,
            tags: arr,
        }
        
    end
end
