require 'spec_helper'

RSpec.describe "Heroes", type: :request do
  describe "GET /heroes" do
    
    before(:all) do
      @hero1 = create(:hero, :random, first_name: 'Dan', last_name: 'Johnson')
      @hero2 = create(:hero, :random, first_name: 'Zack', last_name: 'Andrews')
      @hero3 = create(:hero, :random, first_name: 'Richard', last_name: 'Garriot')
      @hero_schedule1 = create(:hero_schedule, scheduled_on: Time.now, hero: @hero1)
      @hero_schedule2 = create(:hero_schedule, scheduled_on: 1.day.from_now, hero: @hero2)
      @hero_schedule3 = create(:hero_schedule, scheduled_on: 2.day.from_now, hero: @hero1)
      create(:holiday, holiday_date: 1.day.from_now, name: 'New Relic Day')
    end

    it "Returns all heroes sorted by last_name, first_name. schedules and holidays should be returned as expected" do
      get "/heroes"
      response.status.should eq 200
      json["heroes"].count.should eq 3
      json["heroes"][0]["id"].should eq @hero2.id
      json["heroes"][0]["first_name"].should eq @hero2.first_name
      json["heroes"][0]["last_name"].should eq @hero2.last_name
      json["heroes"][0]["title"].should eq @hero2.title
      json["heroes"][0]["bio"].should eq @hero2.bio
      json["heroes"][0]["hero_schedules"][0]['scheduled_on'].should eq @hero_schedule2.scheduled_on.to_s
      json["heroes"][0]["hero_schedules"][0]['holiday']['name'].should eq @hero_schedule2.holiday.name
      json["heroes"][1]["id"].should eq @hero3.id
      json["heroes"][2]["id"].should eq @hero1.id
      json["heroes"][2]["hero_schedules"].count.should eq 2
    end

    it "Returns single hero matching id param" do
      get "/heroes/#{@hero2.id}"
      response.status.should eq 200
      json["hero"]["id"].should eq @hero2.id
      json["hero"]["first_name"].should eq @hero2.first_name
      json["hero"]["last_name"].should eq @hero2.last_name
      json["hero"]["title"].should eq @hero2.title
      json["hero"]["bio"].should eq @hero2.bio
    end

    it "Returns single hero matching id param" do
      get "/heroes/today"
      response.status.should eq 200
      json["hero"]["id"].should eq @hero1.id
      json["hero"]["first_name"].should eq @hero1.first_name
      json["hero"]["last_name"].should eq @hero1.last_name
      json["hero"]["title"].should eq @hero1.title
      json["hero"]["bio"].should eq @hero1.bio
    end

    it "Returns 404 when id param not found" do
      get "/heroes/0"
      response.status.should eq 404
    end
  end
  
  describe "POST /heroes" do
    it "Creating a new hero returns that hero's data and 201 (created)" do
      post "/heroes", { hero: { first_name: "New", last_name: "Guy", title: "Intern", bio: "A little green." } }
      response.status.should eq 201
      json["hero"]["first_name"].should eq "New"
      json["hero"]["last_name"].should eq "Guy"
      json["hero"]["title"].should eq "Intern"
      json["hero"]["bio"].should eq "A little green."
    end
  end

end
