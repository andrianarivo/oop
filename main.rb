require_relative "student"
require_relative "teacher"

student = Student.new(15, "Class C", "Bob jr", false)
puts student.play_hooky
puts student.can_use_services?

teacher = Teacher.new(17, "Maths", "Bob", false)
puts teacher.inspect
puts teacher.can_use_services?