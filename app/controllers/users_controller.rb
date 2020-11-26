class UsersController < ApplicationController

    def login
        arr =[]
        user = User.find_by(username: params[:username])
        
        if user && user.authenticate(params[:password])
            user.questions.each do |q|
                q.tags.each do |t|
                    arr.push(t)
                end
            end
            render json: {
                auth: true,
                user: user,
                tags: arr,
                token: encode({user_id: user.id})
            }
        else
            render json: {
                auth: false,
                info: ["password or username was not valid, please try again"]
            }
        end
    end

    def show
        token = request.headers["Authentication"].split(" ")[1]
        user = User.find(decode(token)["user_id"])

        if user 
            render json: {
                auth: true,
                user: user,
                token: encode({user_id: user.id})
            }
        else
            render json: {
                auth: false,
                info: ["unkown user"]
            }
        end
    end

    def create

        user = User.new(username: params[:username], password: params[:password], level_id: Level.find_by(name: "newUser").id)
        if user.save
            render json: {
                auth: true,
                user: user,
                token: encode({user_id: user.id})
            }
        else
            render json: {
                auth: false,
                info: user.errors.full_messages
            }
        end

    end
end
