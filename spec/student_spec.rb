require_relative '../student'
require_relative '../classroom'

describe Student do
  let(:age) { 18 }
  let(:classroom) { Classroom.new('T2') }
  let(:name) { 'John Doe' }
  let(:parent_permission) { true }

  context '#initialize' do
    it 'creates a new student with the given age, classroom, name, and parent_permission' do
      student = Student.new(age, classroom, name, parent_permission: parent_permission)

      expect(student.age).to eq(age)
      expect(student.classroom).to eq(classroom)
      expect(student.name).to eq(name)
      expect(student.parent_permission).to eq(parent_permission)
    end

    it 'assigns the student to the classroom' do
      student = Student.new(age, classroom, name, parent_permission: parent_permission)

      expect(classroom.students).to include(student)
    end
  end
end
