require 'sliver/version'
require 'sliver/connection'

require 'fcore'

class Sliver
  attr_accessor :middleware

  def initialize(ip_address = '127.0.0.1')
    @middleware = []
    @server = FCore::HttpServer.new(ip_address) do |request, response| 
      Connection.new(request, response, middleware).next
    end
  end

  def listen(port)
    @server.listen(port)
  end
end
