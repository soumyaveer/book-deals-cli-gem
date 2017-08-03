require "spec_helper"

describe BookDeals::Launcher do
  let(:launcher) { BookDeals::Launcher.new}
  let(:cli) {BookDeals::CLI.new}
  describe "does_user_wants_to_quit?" do
    it "returns true if user wants to quit the program" do
      expect(launcher.does_user_wants_to_quit?).to eql(true)
    end

    it "returns false if user does not want to quit" do
      expect(launcher.does_user_wants_to_quit?).to eql(false)
    end
  end

  describe "display_menu" do
    it "displays the menu for the user to select from" do

    end
  end
end
