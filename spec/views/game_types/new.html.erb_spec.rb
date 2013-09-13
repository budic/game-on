require 'spec_helper'

describe "game_types/new" do
  before(:each) do
    assign(:game_type, stub_model(GameType).as_new_record)
  end

  it "renders new game_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", game_types_path, "post" do
    end
  end
end
