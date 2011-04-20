require 'stringio'
require 'net/http'
require 'uri'

module OpenURIClone
  module Meta
    attr_accessor :host, :path
  end
  
  def open(*args)
    if args.first =~ %r{\Ahttp://}
      uri  = URI.parse(args.first)
      body = StringIO.new(Net::HTTP.get(uri))
     
      body.extend(Meta)
      
      body.host = uri.host
      body.path = uri.path
      
      body
    else
      super
    end
  end
end

include OpenURIClone

puts open("http://jordanbyron.com/index.html").read