require 'spec_helper'

describe "event_invites/edit" do
  before(:each) do
    @event_invite = assign(:event_invite, stub_model(EventInvite,
      :status => 1
    ))
  end

  it "renders the edit event_invite form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", event_invite_path(@event_invite), "post" do
      assert_select "input#event_invite_status[name=?]", "event_invite[status]"
    end
  end
end
