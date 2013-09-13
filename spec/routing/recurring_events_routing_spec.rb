require "spec_helper"

describe RecurringEventsController do
  describe "routing" do

    it "routes to #index" do
      get("/recurring_events").should route_to("recurring_events#index")
    end

    it "routes to #new" do
      get("/recurring_events/new").should route_to("recurring_events#new")
    end

    it "routes to #show" do
      get("/recurring_events/1").should route_to("recurring_events#show", :id => "1")
    end

    it "routes to #edit" do
      get("/recurring_events/1/edit").should route_to("recurring_events#edit", :id => "1")
    end

    it "routes to #create" do
      post("/recurring_events").should route_to("recurring_events#create")
    end

    it "routes to #update" do
      put("/recurring_events/1").should route_to("recurring_events#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/recurring_events/1").should route_to("recurring_events#destroy", :id => "1")
    end

  end
end
