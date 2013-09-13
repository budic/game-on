require "spec_helper"

describe RecEventFollowsController do
  describe "routing" do

    it "routes to #index" do
      get("/rec_event_follows").should route_to("rec_event_follows#index")
    end

    it "routes to #new" do
      get("/rec_event_follows/new").should route_to("rec_event_follows#new")
    end

    it "routes to #show" do
      get("/rec_event_follows/1").should route_to("rec_event_follows#show", :id => "1")
    end

    it "routes to #edit" do
      get("/rec_event_follows/1/edit").should route_to("rec_event_follows#edit", :id => "1")
    end

    it "routes to #create" do
      post("/rec_event_follows").should route_to("rec_event_follows#create")
    end

    it "routes to #update" do
      put("/rec_event_follows/1").should route_to("rec_event_follows#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/rec_event_follows/1").should route_to("rec_event_follows#destroy", :id => "1")
    end

  end
end
