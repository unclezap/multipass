class QuizzesController < ApplicationController
    def create
        quiz = Quiz.create(quiz_params)
        if quiz.valid?
            render json: quiz
        else
            #render json error messages
        end
    end

    def delete
        quiz = Quiz.find_by(id: quiz_params(:id))
        Quiz.delete(quiz)
    end

    def show 
        quiz = Quiz.find_by(id: quiz_params(:id))
        render json: quiz
    end

    private
        def quiz_params
            params.require(:quiz).permit(:description, :id, :category, :private, :user_id)
        end
end
