require 'spec_helper'

describe "RecEventFollows" do
  describe "GET /rec_event_follows" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get rec_event_follows_path
      response.status.should be(200)
    end
  end
end
