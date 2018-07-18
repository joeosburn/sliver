class Sliver::Connection
  attr_reader :request, :response, :middleware

  def initialize(request, response, middleware)
    @request = request
    @response = response
    @middleware = middleware.reverse
    @position = -1
  end

  def next
    ware = middleware[@position += 1]
    if ware
      ware.call(request, response, -> { self.next } )
    else
      send_404(request, response)
    end
  end

  private

  def send_404(request, response)
    response.content = '404 Not Found'
    response.status = 404
    response.flush
  end
end
