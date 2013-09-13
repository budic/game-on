require 'spec_helper'

describe "rec_event_follows/show" do
  before(:each) do
    @rec_event_follow = assign(:rec_event_follow, stub_model(RecEventFollow,
      :recurring_event_id => 1,
      :user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
