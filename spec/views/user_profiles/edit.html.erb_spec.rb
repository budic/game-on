require 'spec_helper'

describe "user_profiles/edit" do
  before(:each) do
    @user_profile = assign(:user_profile, stub_model(UserProfile,
      :nickname => "MyString",
      :sms_number => 1
    ))
  end

  it "renders the edit user_profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_profile_path(@user_profile), "post" do
      assert_select "input#user_profile_nickname[name=?]", "user_profile[nickname]"
      assert_select "input#user_profile_sms_number[name=?]", "user_profile[sms_number]"
    end
  end
end
