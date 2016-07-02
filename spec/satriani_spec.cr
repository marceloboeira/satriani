require "./spec_helper"
require "http/client"

describe Satriani do
  let(routes) {
    [
      Satriani::Route.new("/joe-satriani/always-with-me-always-with-you") {|request| "1987" },
      Satriani::Route.new("/joe-satriani/flying-in-a-blue-dream") {|request| "1989" },
    ]
  }

  let(application) { Satriani::Application.new(routes) }

  before do
    Thread.new { application.start }
  end

  context "with a valid route" do
    it "returns success" do
      response = HTTP::Client.get("http://localhost:8000/joe-satriani/always-with-me-always-with-you")

      expect(response.status_code).to eq(200)
    end

    it "renders the content" do
      response = HTTP::Client.get("http://localhost:8000/joe-satriani/always-with-me-always-with-you")

      expect(response.body).to eq("1987")
    end
  end

  context "with a invalid route" do
    it "returns not found" do
      response = HTTP::Client.get("http://localhost:8000/invalid")

      expect(response.status_code).to eq(404)
    end
  end
end
