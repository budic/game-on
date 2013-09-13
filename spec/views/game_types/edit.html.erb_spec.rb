require 'spec_helper'

describe "game_types/edit" do
  before(:each) do
    @game_type = assign(:game_type, stub_model(GameType))
  end

  it "renders the edit game_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", game_type_path(@game_type), "post" do
    end
  end
end
