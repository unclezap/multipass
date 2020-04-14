class QuizSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description
  has_many :questions
  has_many :answers, through: :questions
end 
