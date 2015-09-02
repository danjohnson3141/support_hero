require "spec_helper"

RSpec.describe HeroPreferencesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/hero_preferences").to route_to("hero_preferences#index")
    end

    it "routes to #show" do
      expect(:get => "/hero_preferences/1").to route_to("hero_preferences#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/hero_preferences").to route_to("hero_preferences#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/hero_preferences/1").to route_to("hero_preferences#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/hero_preferences/1").to route_to("hero_preferences#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hero_preferences/1").to route_to("hero_preferences#destroy", :id => "1")
    end

  end
end
