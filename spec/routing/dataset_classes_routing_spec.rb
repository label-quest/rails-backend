require "rails_helper"

RSpec.describe DatasetClassesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/dataset_classes").to route_to("dataset_classes#index")
    end

    it "routes to #show" do
      expect(:get => "/dataset_classes/1").to route_to("dataset_classes#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/dataset_classes").to route_to("dataset_classes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/dataset_classes/1").to route_to("dataset_classes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/dataset_classes/1").to route_to("dataset_classes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/dataset_classes/1").to route_to("dataset_classes#destroy", :id => "1")
    end
  end
end
