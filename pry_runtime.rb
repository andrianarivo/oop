require_relative 'classroom'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'app'

book = Book.new("Lords of the Ring", "Tolkien")
classroom = Classroom.new("T2")
student = Student.new(19, classroom, "Maximus", parent_permission: false)
teacher = Teacher.new(35, "HR", "Eva")
r = Rental.new(Date.today, book, teacher)

rentals_path = "rentals.json"
people_path = "people.json"
books_path = "books.json"

binding.pry
