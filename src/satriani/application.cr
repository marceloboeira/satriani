module Satriani
  class Application
    def self.start(&block)
      instance = Satriani::Application.new

      yield(instance)
    end
  end
end
