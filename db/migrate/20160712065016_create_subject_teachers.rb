class CreateSubjectTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :subject_teachers do |t|
      t.references :subject, foreign_key: true
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
