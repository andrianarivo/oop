require_relative 'person'
require 'json'

class Student < Person
  attr_accessor :id
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    update_classroom(classroom)
  end

  def classroom=(classroom)
    update_classroom(classroom)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def to_s
    "[Student] Name: #{@name}, ID: #{@id}, Age: #{@age}"
  end

  def to_json(*_args)
    JSON.generate(to_h)
  end

  def to_h
    {
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      classroom_id: @classroom.id,
    }   
  end

  def self.from_hash(hash, storage)
    classroom_hash = storage.load_all(CLASSROOM_ENTITY).find { |c| c[:id] == hash[:classroom_id] }
    student = new(hash[:age], Classroom.from_hash(classroom_hash), hash[:name], parent_permission: hash[:parent_permission])
    student.id = hash[:id] 
    student
  end

  private

  def update_classroom(classroom)
    classroom.students.push(self) unless classroom.students.include?(self)
    @classroom = classroom
  end
end
