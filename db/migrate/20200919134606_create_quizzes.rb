class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.string :title, null: false
      t.string :correct, null: false
      t.string :uncorrect1, null: false
      t.string :uncorrect2, null: false
      t.text :explanation, null: false
      t.timestamps
      t.integer :lock_version
    end
  end
end
