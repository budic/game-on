require 'spec_helper'

describe "rec_event_follows/edit" do
  before(:each) do
    @rec_event_follow = assign(:rec_event_follow, stub_model(RecEventFollow,
      :recurring_event_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit rec_event_follow form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rec_event_follow_path(@rec_event_follow), "post" do
      assert_select "input#rec_event_follow_recurring_event_id[name=?]", "rec_event_follow[recurring_event_id]"
      assert_select "input#rec_event_follow_user_id[name=?]", "rec_event_follow[user_id]"
    end
  end
end
