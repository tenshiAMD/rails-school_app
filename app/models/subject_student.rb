class SubjectStudent < ApplicationRecord
  belongs_to :subject
  belongs_to :student

  validates :subject_id, :student_id, presence: true
end
