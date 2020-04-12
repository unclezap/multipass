class User < ApplicationRecord
    has_many :user_scores
    has_many :quizzes
    has_many :quizzes, through: :user_scores
end
