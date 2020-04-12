class CreateUserScores < ActiveRecord::Migration[6.0]
  def change
    create_table :user_scores do |t|
      t.integer :user_id
      t.integer :quiz_id
      t.integer :score

      t.timestamps
    end
  end
end
