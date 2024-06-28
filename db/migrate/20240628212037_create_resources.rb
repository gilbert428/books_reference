class CreateResources < ActiveRecord::Migration[7.1]
  def change
    create_table :resources do |t|
      t.integer :resource_id
      t.string :uri
      t.string :resource_type
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
