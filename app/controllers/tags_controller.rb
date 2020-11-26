class TagsController < ApplicationController

    def create 
        arr = []
        params[:wrongAnswers].each {|ans| UserQuestion.create(question_id: ans, user_id: params[:user])}

        User.find(params[:user]).questions.each do |q|
            q.tags.each do |t|
                arr.push(t)
            end
        end

        render json: {
            auth: true,
            tags: arr,
            # token: encode({user_id: user.id})
        }
        
    end
end
