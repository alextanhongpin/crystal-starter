require "http/server"

server = HTTP::Server.new do | context |
	context.response.content_type = "text/plain"
	context.response.print "hello world"
end

address = server.bind_tcp 8080
puts "listening to http://#{address}"
server.listen
