class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = "Unknown", parent_permission = true)
    rndg = Random.new(Random.new_seed)
    @id = rndg.rand(1_000_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    self.of_age? || @parent_permission
  end

  private

  def of_age?
    @age > 18
  end
end
