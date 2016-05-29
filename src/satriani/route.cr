module Satriani
  class Route
    getter :path, :block

    def initialize(@path : String, &@block : HTTP::Request -> String); end
  end
end
