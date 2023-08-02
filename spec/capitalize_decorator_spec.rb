require_relative '../capitalize_decorator'
require_relative '../person'

RSpec.describe CapitalizeDecorator do
  describe '#correct_name' do
    it 'capitalizes the name of a person' do
      person = Person.new(25, 'john doe')
      decorator = CapitalizeDecorator.new(person)
      expect(decorator.correct_name).to eq('John doe')
    end

    it 'does not modify the original name' do
      person = Person.new(30, 'jane smith')
      decorator = CapitalizeDecorator.new(person)
      decorator.correct_name
      expect(person.name).to eq('jane smith')
    end
  end
end
