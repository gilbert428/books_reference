class Subject < ApplicationRecord
  has_and_belongs_to_many :books, join_table: :books_subjects

  validates :name, presence: true, uniqueness: true

end
