class AddTitleToQuizzes < ActiveRecord::Migration[6.0]
  def change
    add_column :quizzes, :title, :string
  end
end
