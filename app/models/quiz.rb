class Quiz < ApplicationRecord
  validates :title, :correct, :uncorrect1, :uncorrect2, :explanation, presence: true, exclusion: { in: [nil] }
end
