require 'spec_helper'

describe "event_invites/new" do
  before(:each) do
    assign(:event_invite, stub_model(EventInvite,
      :status => 1
    ).as_new_record)
  end

  it "renders new event_invite form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", event_invites_path, "post" do
      assert_select "input#event_invite_status[name=?]", "event_invite[status]"
    end
  end
end
