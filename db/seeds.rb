require "csv"

CSV.foreach('db/csv/quizzes.csv', headers: true) do |row|
  Quiz.create(
    title: row['title'],
    correct: row['correct'],
    uncorrect1: row['uncorrect1'],
    uncorrect2: row['uncorrect2'],
    explanation: row['explanation']
  )
end