class Agent < ApplicationRecord
  has_and_belongs_to_many :books, join_table: :agents_books

  def self.ransackable_associations(auth_object = nil)
     ["books"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["agent_id", "alias", "birth_date", "created_at", "id", "id_value", "name", "updated_at", "webpage"]
  end

  validates :name, presence: true

end
