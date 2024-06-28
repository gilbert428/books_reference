class CreateBooksSubjects < ActiveRecord::Migration[7.1]
  def change
    create_table :books_subjects do |t|
      t.references :book, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
