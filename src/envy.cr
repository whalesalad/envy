require "http/server"

require "./env_info"

module Envy
  def port
    ENV.fetch("PORT", "8080").to_i
  end

  def main
    info = EnvInfo.new

    server = HTTP::Server.new([
      HTTP::LogHandler.new,
    ]) do |context|
      context.response.content_type = "application/json"
      context.response.print info.to_json
    end

    address = server.bind_tcp("0.0.0.0", port)

    puts "Listening on http://#{address}"

    server.listen
  end
end

include Envy

main
