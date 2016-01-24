module Satriani
  class Application
    property server

    def initialize
      @server = Satriani::Server.new
    end

    def start
      @server.start
    end

    def stop
      @server.close
    end
  end
end
