require 'spec_helper'

describe "event_invites/show" do
  before(:each) do
    @event_invite = assign(:event_invite, stub_model(EventInvite,
      :status => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
