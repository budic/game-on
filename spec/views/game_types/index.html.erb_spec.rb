require 'spec_helper'

describe "game_types/index" do
  before(:each) do
    assign(:game_types, [
      stub_model(GameType),
      stub_model(GameType)
    ])
  end

  it "renders a list of game_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
