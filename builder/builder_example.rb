require 'rubygems'
require 'builder'

builder = Builder::XmlMarkup.new

xml = builder.people do |people|
  people.person { |b| b.name("Jim");    b.phone("555-1234") }
  people.person { |b| b.name("Jordan"); b.phone("123-1234") }
  people.person { |b| b.name("Greg");   b.phone("567-1234") }
end

puts xml
