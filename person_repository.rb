require_relative 'person_factory'

PEOPLE_ENTITY = "people".freeze

class PersonRepository

  def initialize(storage)
    @storage = storage
  end

  def save(person)
    @storage.save(person.to_h, PEOPLE_ENTITY)
  end

  def load_all
    @storage.load_all(PEOPLE_ENTITY).map { |person_hash| PersonFactory.from_hash(person_hash, @storage) }
  end
end