require 'spec_helper'

describe "EventInvites" do
  describe "GET /event_invites" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get event_invites_path
      response.status.should be(200)
    end
  end
end
