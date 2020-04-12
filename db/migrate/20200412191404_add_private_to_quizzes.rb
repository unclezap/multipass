class AddPrivateToQuizzes < ActiveRecord::Migration[6.0]
  def change
    add_column :quizzes, :private, :boolean
  end
end
