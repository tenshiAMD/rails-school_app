class CreateSubjectBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :subject_books do |t|
      t.references :subject
      t.references :book

      t.timestamps
    end
  end
end
