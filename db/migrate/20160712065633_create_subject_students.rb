class CreateSubjectStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :subject_students do |t|
      t.references :subject
      t.references :student

      t.timestamps
    end
  end
end
