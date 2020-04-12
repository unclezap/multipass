class UsersController < ApplicationController
    def create
        user = User.create(user_params)

        #if//else on authentication

        if user.valid?
            render json: user
        else
            #render json error messages
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
            params.require(:user).permit(:name, :id)
        end
end
