class UsersController < ApplicationController

    def login
        user = User.find_by(username: params[:username])
        
        if user && user.authenticate(params[:password])
            render json: {
                auth: true,
                user: user,
                tags: user.weaknesses,
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
                tags: user.weaknesses,
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

        user = User.new(username: params[:username], password: params[:password], level_id: Level.find_by(name: "newUser").id, points: 0)
        if user.save
            render json: {
                auth: true,
                user: user,
                tags: [],
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
