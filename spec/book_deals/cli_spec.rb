require "spec_helper"

describe BookDeals::CLI do
  let(:cli) { BookDeals::CLI.new }

  describe "say" do
    it "displays the output to the user" do
      allow($stdout).to receive(:puts)
    end
  end
end
