class Resource < ApplicationRecord
  belongs_to :book

  def self.ransackable_attributes(auth_object = nil)
    ["book_id", "created_at", "id", "id_value", "resource_id", "resource_type", "updated_at", "uri"]
  end

  validates :uri, presence: true
  validates :resource_type, presence: true
end
