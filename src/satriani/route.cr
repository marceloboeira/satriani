module Satriani
  class Route
    getter :path, :block

    def initialize(@path, &@block : HTTP::Request -> String); end
  end
end
