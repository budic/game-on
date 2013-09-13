require 'spec_helper'

describe "recurring_events/edit" do
  before(:each) do
    @recurring_event = assign(:recurring_event, stub_model(RecurringEvent,
      :name => "MyString"
    ))
  end

  it "renders the edit recurring_event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", recurring_event_path(@recurring_event), "post" do
      assert_select "input#recurring_event_name[name=?]", "recurring_event[name]"
    end
  end
end
