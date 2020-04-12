class AddAnswerTextToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :answer_text, :string
  end
end
