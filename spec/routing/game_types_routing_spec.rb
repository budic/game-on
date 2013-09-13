require "spec_helper"

describe GameTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/game_types").should route_to("game_types#index")
    end

    it "routes to #new" do
      get("/game_types/new").should route_to("game_types#new")
    end

    it "routes to #show" do
      get("/game_types/1").should route_to("game_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/game_types/1/edit").should route_to("game_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/game_types").should route_to("game_types#create")
    end

    it "routes to #update" do
      put("/game_types/1").should route_to("game_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/game_types/1").should route_to("game_types#destroy", :id => "1")
    end

  end
end
