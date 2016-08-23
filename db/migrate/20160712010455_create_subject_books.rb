class CreateSubjectBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :subject_books do |t|
      t.references :subject, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
