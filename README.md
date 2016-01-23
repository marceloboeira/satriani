# Satriani [![Build Status](https://travis-ci.org/marceloboeira/satriani.svg?branch=master)](https://travis-ci.org/marceloboeira/satriani)
> Web microframework for Crystal

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  satriani:
    github: marceloboeira/satriani
```

## Usage

**Still only a concept**

```crystal
require "satriani"

Satriani::Application.start do |app|
  app.port = 4000
  app.logger = MyCustomLogger.new

  app.routes do
    get :foo do
      render :bar
    end
  end

  app
end
```

## Contributing

Want to contribute? check [this](CONTRIBUTE.md) first.
