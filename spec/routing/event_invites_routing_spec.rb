require "spec_helper"

describe EventInvitesController do
  describe "routing" do

    it "routes to #index" do
      get("/event_invites").should route_to("event_invites#index")
    end

    it "routes to #new" do
      get("/event_invites/new").should route_to("event_invites#new")
    end

    it "routes to #show" do
      get("/event_invites/1").should route_to("event_invites#show", :id => "1")
    end

    it "routes to #edit" do
      get("/event_invites/1/edit").should route_to("event_invites#edit", :id => "1")
    end

    it "routes to #create" do
      post("/event_invites").should route_to("event_invites#create")
    end

    it "routes to #update" do
      put("/event_invites/1").should route_to("event_invites#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/event_invites/1").should route_to("event_invites#destroy", :id => "1")
    end

  end
end
