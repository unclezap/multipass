class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        user = User.create(user_params)
        if user.valid?
            render json: { user: user, jwt: @token}, status: :created
        else
            render json: {error: 'Failed to make a new account. You might have the same name as someone else, try to be more creative!'}, status: :not_acceptable
        end
    end

    def delete
        user = User.find_by(id: user_params(:id))
        User.delete(user)
    end


    def show 
        user = User.find_by(id: user_params(:id))
        render json: user
    end

    def update
        user = User.find_by(id: user_params(:id))
        User.update(user_params)
        if user.valid? 
            render json: user
        else
            #render json error messages
        end
    end

    private
        def user_params
            params.require(:user).permit(:username, :password, :id)
        end
end
