require "spec_helper"

describe TownsController do
  describe "routing" do

    it "routes to #index" do
      get("/towns").should route_to("towns#index")
    end

    it "routes to #new" do
      get("/towns/new").should route_to("towns#new")
    end

    it "routes to #show" do
      get("/towns/1").should route_to("towns#show", :id => "1")
    end

    it "routes to #edit" do
      get("/towns/1/edit").should route_to("towns#edit", :id => "1")
    end

    it "routes to #create" do
      post("/towns").should route_to("towns#create")
    end

    it "routes to #update" do
      put("/towns/1").should route_to("towns#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/towns/1").should route_to("towns#destroy", :id => "1")
    end

  end
end
