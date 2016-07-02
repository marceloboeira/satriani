module Satriani
  class Application
    property handlers : Array(HTTP::Handler)
    property routes : Array(Satriani::Route)

    def initialize(routes : Array(Satriani::Route))
      @routes = routes

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
