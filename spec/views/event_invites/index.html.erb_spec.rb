require 'spec_helper'

describe "event_invites/index" do
  before(:each) do
    assign(:event_invites, [
      stub_model(EventInvite,
        :status => 1
      ),
      stub_model(EventInvite,
        :status => 1
      )
    ])
  end

  it "renders a list of event_invites" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
