require 'json'

class Classroom
  attr_accessor :label, :id
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    student.classroom = self
    @students.push(student)
  end

  def to_json(*_args)
    JSON.generate(to_h)
  end

  def to_h
    {
      id: @id,
      label: @label,
    }
  end

  def self.from_hash(hash)
    classroom = new(hash[:label])
    classroom.id = hash[:id]
    classroom
  end
end
