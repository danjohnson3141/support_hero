require "rails_helper"

RSpec.describe HeroSchedulesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/hero_schedules").to route_to("hero_schedules#index")
    end

    it "routes to #new" do
      expect(:get => "/hero_schedules/new").to route_to("hero_schedules#new")
    end

    it "routes to #show" do
      expect(:get => "/hero_schedules/1").to route_to("hero_schedules#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/hero_schedules/1/edit").to route_to("hero_schedules#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/hero_schedules").to route_to("hero_schedules#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/hero_schedules/1").to route_to("hero_schedules#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/hero_schedules/1").to route_to("hero_schedules#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hero_schedules/1").to route_to("hero_schedules#destroy", :id => "1")
    end

  end
end
