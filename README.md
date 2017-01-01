![Satriani](https://s-media-cache-ak0.pinimg.com/736x/e8/06/13/e80613c669a5e198803120573f414c00.jpg)

# :guitar: Satriani [![Build Status](https://travis-ci.org/marceloboeira/satriani.svg?branch=master)](https://travis-ci.org/marceloboeira/satriani)
> Web microframework for Crystal

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  satriani:
    github: marceloboeira/satriani
```

## Example

In the future it will be easier to create your app with a proper DSL, for now:

```crystal
require "../src/satriani"

routes = [
  Satriani::Route.new("/hello-world") do |request|
    "hello-world"
  end
]

Satriani::Application.new(routes).start
```

## Contributing

Want to contribute? check [this](CONTRIBUTE.md) first.
