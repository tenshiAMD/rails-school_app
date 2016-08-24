# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..5).each do |n|
  Teacher.create(name: "Teacher_#{n}")
  Student.create(name: "Student_#{n}")
  Book.create(name: "Book_#{n}")
  Subject.create(name: "Subject_#{n}")

  (1..5).each do |i|
    SubjectBook.create(subject_id: n, book_id: i)
    SubjectTeacher.create(subject_id: n, teacher_id: i)
    SubjectStudent.create(subject_id: n, student_id: i)
  end
end
