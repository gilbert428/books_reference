class Book < ApplicationRecord
  has_and_belongs_to_many :agents, join_table: :agents_books
  has_and_belongs_to_many :subjects, join_table: :books_subjects
  has_many :resources
  has_one_attached :image

  def self.ransackable_attributes(auth_object = nil)
    ["title", "description", "downloads", "license", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["agents", "resources", "subjects"]
  end

  validates :title, presence: true
  validates :downloads, numericality: { only_integer: true }
end
