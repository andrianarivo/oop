require_relative 'nameable'
require 'json'

class Person < Nameable
  attr_accessor :name, :age, :parent_permission, :rentals, :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    rental.person = self
    @rentals.push(rental)
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
    }
  end

  def self.from_hash(hash)
    person = new(hash[:age], hash[:name], parent_permission: hash[:parent_permission])
    person.id = hash[:id]
    person
  end

  private

  def of_age?
    @age > 18
  end

  def to_s
    "[Person] Name: #{@name}, Age: #{@age}"
  end
end
