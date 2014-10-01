require "erb"
require "webrick"
include WEBrick

class IndexController  < HTTPServlet::AbstractServlet
    
  def index
	  @name = "Nicola"
	  @blogpost ||= "No blog posts"
  end

  def get_binding
     binding 
  end

  def erb_conversion(request, response)
  	self.index 
    template_file = File.read('./views/index.html')
    template = ERB.new(template_file)
    response.body = template.result(self.get_binding)
    response['Content-Type'] = 'text/html'
  end

  def do_GET(request, response)
  	self.erb_conversion(request, response)
  end

  def do_POST(request, response)
  	self.erb_conversion(request, response)
  	@blogpost = request.body
  	p @blogpost
  	# @author = params[:author]
  	# @content = params[:content]
  	# p @author
  	# p @content

  end

end
