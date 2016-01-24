module Satriani
  class Server < HTTP::Server
    def initialize
      super("0.0.0.0", 3000, [HTTP::LogHandler.new, Satriani::Handler.new])
    end

    def start
      listen
    end

    def stop
      close
    end
  end
end
