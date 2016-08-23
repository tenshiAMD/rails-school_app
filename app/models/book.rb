class Book < ApplicationRecord
  has_many :subject_books, dependent: :destroy
  has_many :subjects, through: :subject_books

  validates :name, presence: true
end
