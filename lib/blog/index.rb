require "erb"

class IndexController
	def index
		@name = "Nicola"
	end
	def get_binding
		binding 
	end
end

