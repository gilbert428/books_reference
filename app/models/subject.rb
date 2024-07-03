class Subject < ApplicationRecord
  has_and_belongs_to_many :books, join_table: :books_subjects

  def self.ransackable_attributes(auth_object = nil)
    ["agents", "bookshelves", "created_at", "id", "id_value", "name", "resources", "subject_id", "subjects", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["books"]
  end

  validates :name, presence: true, uniqueness: true

end
