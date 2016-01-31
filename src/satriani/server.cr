module Satriani
  class Server < HTTP::Server
    def initialize(@handlers : Array)
      super("0.0.0.0", 8000, @handlers)
    end
  end
end
