require "./spec_helper"

spawn do
  routes = [
    Satriani::Route.new("/joe-satriani/always-with-me-always-with-you") {|request| "1987" },
    Satriani::Route.new("/joe-satriani/flying-in-a-blue-dream") {|request| "1989" },
  ]

  Satriani::Application.new(routes).start
end

# ensure the server has started before connection attempt
sleep 0.001

describe Satriani do
  http = HTTP::Client.new("0.0.0.0", 8000)

  context "with a valid route" do
    it "returns success" do
      response = http.get("/joe-satriani/always-with-me-always-with-you")

      response.status_code.should eq(200)
    end

    it "renders the content" do
      response = http.get("/joe-satriani/always-with-me-always-with-you")


      response.body.should eq("1987")
    end
  end

  context "with a invalid route" do
    it "returns not found" do
      response = http.get("/invalid")

      response.status_code.should eq(404)
    end
  end
end
