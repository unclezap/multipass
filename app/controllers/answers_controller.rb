class AnswersController < ApplicationController
    def create
        answer = Answer.create(answer_params)
        if answer.valid?
            render json: answer
        else
            #render json errors
        end
    end

    def show
        answer = Answer.find(answer_params)
    end

    private
        def answer_params
            params.require(:answer).permit(:question_id, :correct, :answer_text, :id)
        end
end 
