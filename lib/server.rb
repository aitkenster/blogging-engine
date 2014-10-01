require 'webrick'
require_relative './blog/index.rb'
include WEBrick
server = HTTPServer.new(
    :Port => 3000,
    :DocumentRoot => Dir::pwd
    )

class IndexServlet  < HTTPServlet::AbstractServlet
  def do_GET(request, response)
    controller = IndexController.new
    controller.index 
    template_file = File.read('./lib/blog/index.html')
    template = ERB.new(template_file)
    response.body = template.result(controller.get_binding)
    response['Content-Type'] = 'text/html'
  end
end
server.mount("/", IndexServlet)

trap("INT"){server.shutdown}

server.start



