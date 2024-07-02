class Book < ApplicationRecord
  has_and_belongs_to_many :agents, join_table: :agents_books
  has_and_belongs_to_many :subjects, join_table: :books_subjects
  has_many :resources

  validates :title, presence: true
  validates :downloads, numericality: { only_integer: true }
end
