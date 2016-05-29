require "http/server"

module Satriani
  class Router < HTTP::Handler
    def initialize(@routes : Array(Satriani::Route)); end

    def call(context)
      context.response.content_type = "text/html"

      @routes.each do |route|
        if route.path == context.request.path
          context.response.status_code = 200
          output = route.block.call(context.request)
          context.response.print(output)

          return context.response
        end
      end

      return context.response
    end
  end
end
