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
      json_teacher = @teacher.to_json
      # rubocop:disable Layout/LineLength
      expect(json_teacher).to eql "{\"id\":#{@teacher.id},\"name\":\"David\",\"age\":27,\"parent_permission\":true,\"specialization\":\"Maths\"}"
    end
  end

  context '#from_json' do
    it 'returns an new teacher object from JSON' do
      json = JSON.parse('{"id":3,"name":"David","age":27,"parent_permission":true,"specialization":"Maths"}')
      expect(Teacher.from_json(json)).to be_an_instance_of Teacher
    end
  end
end
