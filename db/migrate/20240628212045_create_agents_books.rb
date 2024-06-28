class CreateAgentsBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :agents_books do |t|
      t.references :agent, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
