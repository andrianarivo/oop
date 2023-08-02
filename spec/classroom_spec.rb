require_relative 'spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new('T2')
  end

  context '#new' do
    it 'returns a new classroom object' do
      expect(@classroom).to be_an_instance_of Classroom
    end

    it 'has an empty students array' do
      expect(@classroom.students).to be_empty
    end

    it 'raise ArgumentError when given fewer parameters than 1' do
      expect { Classroom.new }.to raise_error ArgumentError
    end
  end

  context '#add_student' do
    it 'adds student to the classroom' do
      Student.new(19, @classroom, 'Binod')
      expect(@classroom.students).not_to be_empty
    end
  end

  context '#to_json' do
    it 'returns the json representation of the classroom' do
      json_classroom = @classroom.to_json
      expect(json_classroom).to eql '{"label":"T2"}'
    end
  end

  context '#label' do
    it 'returns the correct label' do
      expect(@classroom.label).to eql 'T2'
    end
  end

  context '#students' do
    it 'returns the correct students' do
      expect(@classroom.students).to be_empty
    end
  end
end
