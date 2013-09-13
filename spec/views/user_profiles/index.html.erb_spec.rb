require 'spec_helper'

describe "user_profiles/index" do
  before(:each) do
    assign(:user_profiles, [
      stub_model(UserProfile,
        :nickname => "Nickname",
        :sms_number => 1
      ),
      stub_model(UserProfile,
        :nickname => "Nickname",
        :sms_number => 1
      )
    ])
  end

  it "renders a list of user_profiles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nickname".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
