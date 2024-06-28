class Book < ApplicationRecord
  has_many :resources
  has_many :agents_books
  has_many :agents, through: :agents_books
  has_many :books_subjects
  has_many :subjects, through: :books_subjects

  validates :title, presence: true
  validates :downloads, numericality: { only_integer: true }
end
