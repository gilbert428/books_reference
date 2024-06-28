class Resource < ApplicationRecord
  belongs_to :book

  validates :uri, presence: true
  validates :resource_type, presence: true
end
