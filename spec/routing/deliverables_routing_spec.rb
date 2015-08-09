require "rails_helper"

RSpec.describe DeliverablesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/deliverables").to route_to("deliverables#index")
    end

    it "routes to #new" do
      expect(:get => "/deliverables/new").to route_to("deliverables#new")
    end

    it "routes to #show" do
      expect(:get => "/deliverables/1").to route_to("deliverables#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/deliverables/1/edit").to route_to("deliverables#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/deliverables").to route_to("deliverables#create")
    end

    it "routes to #update" do
      expect(:put => "/deliverables/1").to route_to("deliverables#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/deliverables/1").to route_to("deliverables#destroy", :id => "1")
    end

  end
end
