class AnswerSerializer
  include FastJsonapi::ObjectSerializer 
  attributes :answer_text, :correct
  belongs_to :question
end 
