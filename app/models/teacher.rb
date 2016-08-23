class Teacher < ApplicationRecord
  has_many :subject_teachers, dependent: :destroy
  has_many :subjects, through: :subject_teachers

  has_many :students, through: :subjects
  has_many :books, through: :subjects

  validates :name, presence: true
end
