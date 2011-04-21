require "prawn"

Prawn::Document.generate("hello.pdf") do
  font "Courier"
  text "Hello World"
end
