require 'webrick'
require_relative './controllers/index_controller.rb'
include WEBrick
server = HTTPServer.new(
    :Port => 3000,
    :DocumentRoot => Dir::pwd
    )

server.mount("/", IndexController)

trap("INT"){server.shutdown}

server.start



