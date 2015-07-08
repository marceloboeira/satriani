require "satriani"

Satriani.define do
  on get do
    on path("") do
      res.write "Home"
    end
    on path("hello-world") do
      res.write "Hello World"
    end
  end
end
