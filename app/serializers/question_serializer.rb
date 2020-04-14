class QuestionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :question_text
  belongs_to :quiz
  has_many :answers
end 
