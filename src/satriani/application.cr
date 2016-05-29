module Satriani
  class Application
    def initialize
      @routes = [] of Satriani::Route
      @handlers = [] of HTTP::Handler
      @handlers << HTTP::LogHandler.new
      @handlers << Satriani::Router.new(@routes)

      @server = Satriani::Server.new(@handlers)
    end

    def start
      @server.listen
    end

    def stop
      @server.close
    end
  end
end
