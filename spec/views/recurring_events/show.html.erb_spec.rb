require 'spec_helper'

describe "recurring_events/show" do
  before(:each) do
    @recurring_event = assign(:recurring_event, stub_model(RecurringEvent,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
