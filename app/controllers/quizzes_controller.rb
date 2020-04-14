class QuizzesController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]
    def index
        quizzes = Quiz.all
        render json: quizzes
    end
    
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
        quiz = Quiz.find_by(id: params[:id])
        options = {
            include: [:questions, :answers]
        }
        render json: QuizSerializer.new(quiz, options)
    end

    private
        def quiz_params
            params.require(:quiz).permit(:description, :id, :category, :private, :user_id)
        end
end
 