require_relative 'spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new(27, 'Maths', 'David')
  end

  context '#new' do
    it 'returns a new teacher object' do
      expect(@teacher).to be_an_instance_of Teacher
    end

    it 'raise ArgumentError when given fewer parameters than 2' do
      expect { Teacher.new(27) }.to raise_error ArgumentError
    end
  end

  context '#can_use_services' do
    it 'returns the correct can_use_services value' do
      expect(@teacher.can_use_services?).to eql true
    end
  end

  context '#specialization' do
    it 'returns the correct specialization' do
      expect(@teacher.specialization).to eql 'Maths'
    end
  end

  context '#to_s' do
    it 'returns the correct string representation' do
      expect(@teacher.to_s).to eql "[Teacher] Name: David, ID: #{@teacher.id}, Age: 27"
    end
  end

  context '#to_json' do
    it 'returns the json representation of the teacher' do
      matching = File.read('spec_json/teacher')
      expected = matching.gsub('@teacher.id', @teacher.id.to_s)
      json_teacher = @teacher.to_json
      expect(json_teacher).to eql expected
    end
  end

  context '#from_json' do
    it 'returns an new teacher object from JSON' do
      json_file = File.read('spec_json/teacher')
      json_string = json_file.gsub('@teacher.id', @teacher.id.to_s)
      json = JSON.parse(json_string)
      expect(Teacher.from_json(json)).to be_an_instance_of Teacher
    end
  end
end
