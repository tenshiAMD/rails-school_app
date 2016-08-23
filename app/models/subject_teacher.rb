class SubjectTeacher < ApplicationRecord
  belongs_to :subject
  belongs_to :teacher

  validates :subject_id, :teacher_id, presence: true
end
