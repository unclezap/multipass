class UserScoresController < ApplicationController
    skip_before_action :authorized, only: [:by_quiz]

    def create
        user_score = UserScore.create(user_score_params)

        #authentication if/else statement.
        
        if user_score.valid?
            render json: user_score
        else
             #render json error messages
        end
    end

    def by_user
        user_scores = UserScore.select{|score| score.user_id === 12}
        #see by_quiz for help
        render json: user_scores
    end

    def by_quiz
        user_scores = UserScore.select{|score| score.quiz_id === params[:id].to_i}
        this_quiz = Quiz.all.find_by(id: params[:id].to_i)
        usobj = {quiz: this_quiz, user: this_quiz.user.username}
        scores_obj = {}
        user_scores.each do |this_score|
            scores_obj[this_score.id] = {
                score: this_score.score,
                user: this_score.user.username
            }
        end
        usobj[:scores] = scores_obj
        render json: usobj
    end
    
    private
        def user_score_params
            params.require(:user_score).permit(:user_id, :quiz_id, :score, :id)
        end
end
