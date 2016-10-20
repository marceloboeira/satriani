require "./spec_helper"
require "http/client"

module SpecHelper
  def get(path)
    HTTP::Client.get("http://localhost:8000#{path}")
  end
end

include SpecHelper

spawn do
  routes = [
    Satriani::Route.new("/joe-satriani/always-with-me-always-with-you") {|request| "1987" },
    Satriani::Route.new("/joe-satriani/flying-in-a-blue-dream") {|request| "1989" },
  ]

  Satriani::Application.new(routes).start
end

# ensure the server has started before connection attempt
sleep 0.1

describe Satriani do

  context "with a valid route" do
    it "returns success" do
      response = get("/joe-satriani/always-with-me-always-with-you")

      response.status_code.should eq(200)
    end

    it "renders the content" do
      response = get("/joe-satriani/always-with-me-always-with-you")


      response.body.should eq("1987")
    end
  end

  context "with a invalid route" do
    it "returns not found" do
      response = get("/invalid")

      response.status_code.should eq(404)
    end
  end
end
