class Parent
  def trace
    "E"
  end
end

module IncludedModuleOne
  def trace
    "M" + super
  end
end

module IncludedModuleTwo
  def trace
    "O" + super
  end
end

class Child < Parent
  include IncludedModuleOne
  include IncludedModuleTwo
  
  def trace
    "C" + super
  end
end

module ExtendedModuleOne
  def trace
    "L" + super
  end
end

module ExtendedModuleTwo
  def trace
    "E" + super
  end
end

obj = Child.new

obj.extend(ExtendedModuleOne)
obj.extend(ExtendedModuleTwo)

def obj.trace
  "W" + super
end

puts obj.trace
