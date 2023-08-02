require 'rspec'
require_relative '../person'

RSpec.describe Person do
  describe '#initialize' do
    it 'creates a new person with age, name, and parent permission' do
      person = Person.new(25, 'John', parent_permission: true)
      expect(person.age).to eq(25)
      expect(person.name).to eq('John')
      expect(person.parent_permission).to be(true)
      expect(person.rentals).to be_empty
    end

    it 'generates a random ID for the person' do
      person1 = Person.new(30, 'Alice', parent_permission: true)
      person2 = Person.new(35, 'Bob', parent_permission: false)

      expect(person1.id).not_to eq(person2.id)
    end

    it 'sets default name to "Unknown" if name is not provided' do
      person = Person.new(18)
      expect(person.name).to eq('Unknown')
    end
  end
end
