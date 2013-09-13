require 'spec_helper'

describe "rec_event_follows/index" do
  before(:each) do
    assign(:rec_event_follows, [
      stub_model(RecEventFollow,
        :recurring_event_id => 1,
        :user_id => 2
      ),
      stub_model(RecEventFollow,
        :recurring_event_id => 1,
        :user_id => 2
      )
    ])
  end

  it "renders a list of rec_event_follows" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
