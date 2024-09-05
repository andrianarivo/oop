require 'json'

class Classroom
  attr_accessor :label
  attr_reader :students, :id

  def initialize(id, label)
    @id = id 
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
      entity_type: self.class
    }
  end

  def self.from_hash(hash)
    new(hash[:label])
  end
end
