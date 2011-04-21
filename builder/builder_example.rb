require 'rubygems'
require 'builder'

builder = Builder::XmlMarkup.new

xml = builder.class do |roster|
  roster.student { |b| b.name("Jim");    b.phone("555-1234") }
  roster.student { |b| b.name("Jordan"); b.phone("123-1234") }
  roster.student { |b| b.name("Greg");   b.phone("567-1234") }
end

puts xml
