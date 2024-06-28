class Agent < ApplicationRecord
  has_many :agents_books
  has_many :books, through: :agents_books

  validates :name, presence: true

end
