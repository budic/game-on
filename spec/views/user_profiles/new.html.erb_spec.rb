require 'spec_helper'

describe "user_profiles/new" do
  before(:each) do
    assign(:user_profile, stub_model(UserProfile,
      :nickname => "MyString",
      :sms_number => 1
    ).as_new_record)
  end

  it "renders new user_profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_profiles_path, "post" do
      assert_select "input#user_profile_nickname[name=?]", "user_profile[nickname]"
      assert_select "input#user_profile_sms_number[name=?]", "user_profile[sms_number]"
    end
  end
end
