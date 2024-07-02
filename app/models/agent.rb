class Agent < ApplicationRecord
  has_and_belongs_to_many :books, join_table: :agents_books

  validates :name, presence: true

end
