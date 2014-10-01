require "erb"
require "webrick"
include WEBrick

class IndexController  < HTTPServlet::AbstractServlet
    
  def index
	  @name = "Nicola"
  end

  def get_binding
     binding 
  end

  def do_GET(request, response)
    self.index 
    template_file = File.read('./views/index.html')
    template = ERB.new(template_file)
    response.body = template.result(self.get_binding)
    response['Content-Type'] = 'text/html'
  end

end
