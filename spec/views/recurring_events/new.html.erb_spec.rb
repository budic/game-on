require 'spec_helper'

describe "recurring_events/new" do
  before(:each) do
    assign(:recurring_event, stub_model(RecurringEvent,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new recurring_event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", recurring_events_path, "post" do
      assert_select "input#recurring_event_name[name=?]", "recurring_event[name]"
    end
  end
end
