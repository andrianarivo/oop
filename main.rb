require_relative 'student'
require_relative 'teacher'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

student = Student.new(15, 'Class C', 'Bob jr', parent_permission: false)
puts student.play_hooky
puts student.can_use_services?

teacher = Teacher.new(17, 'Maths', 'Bob', parent_permission: false)
puts teacher.inspect
puts teacher.can_use_services?

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name

classroom = Classroom.new('Second 2')
classroom.add_student(student)

book = Book.new('Lords of the Ring', 'Tolkien')
rental = Rental.new('2023-07-26', book, student)

puts rental.inspect
puts book.inspect
puts student.inspect
