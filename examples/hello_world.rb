require "../src/satriani"

routes = [
  Satriani::Route.new("/hello-world") do |request|
    "hello-world"
  end
]

Satriani::Application.new(routes).start
