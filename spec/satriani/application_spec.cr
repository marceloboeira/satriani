require "./../spec_helper"

describe Satriani::Application do
  describe "when starting an application" do
    it "calls the received block" do
      block_was_called = false

      Satriani::Application.start do |app|
        block_was_called = true
      end

      block_was_called.should eq(true)
    end

    it "gives an application instance as a block argument" do
      Satriani::Application.start do |app|
        app.should be_a(Satriani::Application)
      end
    end
  end
end
