class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.text :title, null: false
      t.text :correct, null: false
      t.text :uncorrect1, null: false
      t.text :uncorrect2, null: false
      t.text :explanation, null: false
      t.timestamps
      t.integer :lock_version
    end
  end
end
