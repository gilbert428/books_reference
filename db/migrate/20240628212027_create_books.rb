class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.integer :book_id
      t.string :title
      t.text :description
      t.integer :downloads
      t.string :license

      t.timestamps
    end
  end
end
