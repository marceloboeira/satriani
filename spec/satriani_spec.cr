require "./spec_helper"
require "http/client"

describe Satriani do
  before do
    Thread.new { Satriani::Application.new.start }
  end


  context "with a valid route" do
    it "returns success" do
      response = HTTP::Client.get("http://localhost:8000")

      expect(response.status_code).to eq(200)
    end
  end
end
