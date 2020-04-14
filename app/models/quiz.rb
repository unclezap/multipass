class Quiz < ApplicationRecord
    belongs_to :user
    has_many :user_scores
    has_many :users, through: :user_scores
    has_many :questions
    has_many :answers, through: :questions
end
