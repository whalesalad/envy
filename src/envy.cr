require "json"
require "http/server"

module Envy
  def environment
    Hash.zip(ENV.keys, ENV.values)
  end

  def port
    ENV["PORT"].to_i || 8080
  end

  def main
    server = HTTP::Server.new do |context|
      context.response.content_type = "application/json"
      context.response.print environment.to_json
    end

    address = server.bind_tcp(port)

    puts "Listening on http://#{address}"

    server.listen
  end
end

include Envy

main
