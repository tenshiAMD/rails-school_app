class Student < ApplicationRecord
  has_many :subject_students, dependent: :destroy
  has_many :subjects, through: :subject_students

  has_many :teachers, through: :subjects
  has_many :books, through: :subjects

  validates :name, presence: true
end
