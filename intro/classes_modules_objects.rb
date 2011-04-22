class Person < Struct.new(:first_name, :last_name)
  def name
    "#{first_name} #{last_name}"
  end
end

person = Person.new
person.first_name = "Gregory"
person.last_name  = "Brown"
puts person.name