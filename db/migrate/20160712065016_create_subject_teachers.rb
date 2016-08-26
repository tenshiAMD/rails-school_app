class CreateSubjectTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :subject_teachers do |t|
      t.references :subject
      t.references :teacher

      t.timestamps
    end
  end
end
