class QuizzesController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]
    def index
        quizzes = Quiz.all
        render json: quizzes
    end
    
    def create
        cu = current_user.id
        state_params = {
            title: params[:quiz][:title], 
            description: params[:quiz][:description], 
            category: params[:quiz][:category], 
            user_id: cu
        }
        quiz = Quiz.create(state_params)
        if quiz.valid?
            create_questions(params[:quiz][:questions], quiz.id)
            render json: quiz
        else
            render json: {error: 'Something went wrong'}
        end
    end

    def create_questions(array, id)
        array.each do |question|
            new = Question.create({quiz_id: id, question_text: question[:question_text]})
            create_answers(question[:answers], new.id)
        end
    end

    def create_answers(array, id)
        array.each do |answer| 
            Answer.create({question_id: id, answer_text: answer[:answer_text], correct: answer[:correct]})
        end
    end

    def delete
        quiz = Quiz.find_by(id: quiz_params(:id))
        Quiz.delete(quiz)
    end

    # show no longer needs to be authorized.
    # if quiz is private, a user should be authorized. 
    # need to add that logic.
    def show
        quiz = Quiz.find_by(id: params[:id])

        #remving some categories for show page.
        quiz_detail = {
            category: quiz.category,
            id: quiz.id,
            private: quiz.private,
            title: quiz.title
        }

        #getting username instead of user_id
        user = User.find(quiz.user_id)

        #begin structuring our question data.
        questions = Question.all.select{|question| question.quiz_id == params[:id].to_i}
        question_detail = {} 
        questions.each do |question| 
            question_hash = {}
            question_hash[:text] = question.question_text
            question_hash[:id] = question.id
            answer_array = []
            question_hash[:answers] = answer_array
            answers = Answer.all.select{|answer| answer.question_id == question.id}
            answers.each do |answer|
                #structuring our answer object.
                answer_detail = {
                    answer: answer.answer_text,
                    correct: answer.correct,
                    answer_id: answer.id,
                    question_id: answer.question_id
                }
                answer_array.push(answer_detail)
            end

            question_detail[question.id] = question_hash
        end
        data = {
            quiz: quiz_detail,
            user: user.username,
            questions: question_detail
        }

        render json: data
    end

    private
        def quiz_params
            params.require(:quiz).permit(:title, :description, :id, :category, :private, :user_id)
        end
end 
 