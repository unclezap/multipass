class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        # password is not salted when user is typing in form.
        # byebug
        @user = User.find_by(username: params["username"])
        # byebug
        # .authenticate is not comparing our params[:password] correctly to our user's password
        if @user && @user.authenticate(params["password"])
            token = encode_token({user_id: @user.id})
            render json: {user: @user, jwt: token}, status: :accepted
        else
            render json: {message: 'The cops are coming for you and your taxi'}, status: :unauthorized
        end
    end

    def show
        user = User.find_by(id: user_id)
        if logged_in?
            render json: { id: user.id, username: user.username }
        else
            render json: {error: 'No user could be found'}, status: 401
        end
    end

    private

    def user_login_params
        params.require(:user).permit(:username, :password, :user_id)
    end
end
