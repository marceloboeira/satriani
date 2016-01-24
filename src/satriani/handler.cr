module Satriani
  class Handler < HTTP::Handler
    def call(request)
      return HTTP::Response.ok("text/plain", "Satch Boogie")
    end
  end
end
