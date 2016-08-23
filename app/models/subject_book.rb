class SubjectBook < ApplicationRecord
  belongs_to :subject
  belongs_to :book

  validates :subject_id, :book_id, presence: true
end
