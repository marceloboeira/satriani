require "http/server"

module Satriani
  class Server < HTTP::Server
    def initialize(@handlers : Array(HTTP::Handler))
      super("0.0.0.0", 8000, @handlers)
    end
  end
end
