class QuestionsController < ApplicationController
    def create
        question = Question.new(question_params)
        if question.valid?
            render json: question
        else
            #render json errors
        end
    end

    def show
        question = Question.find_by(id: question_params(:id))
        render json: question
    end

    private
        def question_params
            params.require(:question).permit(:question_text, :quiz_id, :id)
        end
end
