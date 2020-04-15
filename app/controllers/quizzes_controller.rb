class QuizzesController < ApplicationController
    skip_before_action :authorized, only: [:index]
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
        questions = Question.all.select{|question| question.quiz_id == params[:id].to_i}
        qobj = {} 
        questions.each do |question| 
            answers = Answer.all.select{|answer| answer.question_id == question.id}
            qobj[question.id] = answers
            #qobj[question.id]["text"] = question.question_text
        end
        
        data = {
            quiz: quiz,
            questions: questions 
        }

        # data = {
        #     quiz: quiz,
        #     questions: {
        #         text_of_question: [
        #             answer_1,
        #             answer2
        #         ]
        #     }
        # }

        render json: data
    end

    private
        def quiz_params
            params.require(:quiz).permit(:description, :id, :category, :private, :user_id)
        end
end 
 