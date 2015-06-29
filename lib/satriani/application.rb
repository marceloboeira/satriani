require "yaml"

class Satriani::Application
  DEFAULT_CONFIG_PATH = 'config.yml'
  DEFAULT_PORT = 1956

  attr_accessor :name, :version, :port 
  
  def initialize(options = {})
    normalize(options)
    puts name, version, port
  end

  def run
    rack_it
  end

  def self.run(options = {})
    instance = self.new(options)
    instance.run
    instance
  end

  private

  def normalize(options = {})
    self.name = options.delete(:name) || "Satriani"
    self.version = options.delete(:version) || "0.0.0"
    self.port = options.delete(:port) || 1956
  end

  def rack_it
    Rack::Handler::WEBrick.run(Satriani::RequestController.new, :Port => port)
  end  
end