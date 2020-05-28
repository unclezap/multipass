class ApplicationController < ActionController::API
    before_action :authorized

    def encode_token(payload)
        JWT.encode(payload, 'al3xTr3b3K')
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[0]
            begin
                JWT.decode(token, 'al3xTr3b3K', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: {message: 'Please sign up for a Multi Pass! And go to the check-in counter to get your free trip to Fhloston Paradise!'}, status: :unauthorized unless logged_in?
    end

end
