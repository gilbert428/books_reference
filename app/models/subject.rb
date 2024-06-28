class Subject < ApplicationRecord
  has_many :books_subjects
  has_many :books, through: :books_subjects

  validates :name, presence: true, uniqueness: true
end
