require 'rubygems'
require 'builder'

module BuilderCustom
  class XmlMarkup < BasicObject
    
    def initialize
      @output = ""
    end
    
    def method_missing(id, *args, &block)
      raise ArgumentError if args.first && block
      
      @output << "<#{id}>"
      if block
        block.call(self)
      else
        @output << args.first
      end
      @output << "</#{id}>"

      return @output
    end
    
  end
end

builder = BuilderCustom::XmlMarkup.new

xml = builder.people do |people|
  people.person { |b| b.name("Jim");    b.phone("555-1234") }
  people.person { |b| b.name("Jordan"); b.phone("123-1234") }
  people.person { |b| b.name("Greg");   b.phone("567-1234") }
end

puts xml