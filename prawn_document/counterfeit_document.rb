module HTML
  class Document
    def self.generate(html_file, &block)
      document = new

      if block.arity == 0
        document.instance_eval(&block)
      else
        block.call(document)
      end

      File.open(html_file, "w") { |f| f << document.render }
    end

    def initialize
      @body = ""
    end

    def font(name)
      @font = name
    end

    def text(content)
      @body << "<p style='font-family: #{@font}'>#{content}</p>"
    end

    def render
      "<html><body>#{@body}</body></html>"
    end
  end
end

HTML::Document.generate("hello.html") do |doc|
  doc.font "Courier"
  doc.text "Hello World"
end
