require 'spec_helper'

describe "recurring_events/index" do
  before(:each) do
    assign(:recurring_events, [
      stub_model(RecurringEvent,
        :name => "Name"
      ),
      stub_model(RecurringEvent,
        :name => "Name"
      )
    ])
  end

  it "renders a list of recurring_events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
