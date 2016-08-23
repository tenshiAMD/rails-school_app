class CreateSubjectStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :subject_students do |t|
      t.references :subject, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
