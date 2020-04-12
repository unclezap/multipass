class UserScoresController < ApplicationController
    def create
        user_score = UserScore.create(user_score_params)

        #authentication if/else statement.
        
        if user_score.valid?
            render json: user_score
        else
             #render json error messages
        end
    end

    def show
        user_score = UserScore.find_by(id: user_score_params(:id))
        render json: user_score
    end
    
    private
        def user_score_params
            params.require(:user_score).permit(:user_id, :quiz_id, :score, :id)
        end
end
