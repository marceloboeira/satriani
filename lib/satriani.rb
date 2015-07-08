require "satriani/version"
require "satriani/application"

module Satriani

  def self.define(&block)
    @instance = Satriani::Application.new(&block)
  end

  def self.instance
    @instance
  end
end
