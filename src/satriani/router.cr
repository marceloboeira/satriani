module Satriani
  class Router < HTTP::Handler
    def initialize(@routes); end

    def call(context)
      context.response.content_type = "text/html"

      begin
        @routes.each do |route|
          if route.path == context.request.path
            context.response.status_code = 200
            output = route.block.call(context.request)
            context.response.print(output)

            return context.response
          end
        end
      end

      return context.response
    end
  end
end
