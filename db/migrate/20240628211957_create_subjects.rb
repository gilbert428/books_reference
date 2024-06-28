class CreateSubjects < ActiveRecord::Migration[7.1]
  def change
    create_table :subjects do |t|
      t.integer :subject_id
      t.string :name

      t.timestamps
    end
  end
end
