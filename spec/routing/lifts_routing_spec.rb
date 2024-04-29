require "rails_helper"

RSpec.describe LiftsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/lifts").to route_to("lifts#index")
    end

    it "routes to #new" do
      expect(get: "/lifts/new").to route_to("lifts#new")
    end

    it "routes to #show" do
      expect(get: "/lifts/1").to route_to("lifts#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/lifts/1/edit").to route_to("lifts#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/lifts").to route_to("lifts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/lifts/1").to route_to("lifts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/lifts/1").to route_to("lifts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/lifts/1").to route_to("lifts#destroy", id: "1")
    end
  end
end
