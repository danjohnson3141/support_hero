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

    it "Returns today's support hero" do
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
      post "/heroes", { hero: { first_name: "Johnny", last_name: "New Guy", title: "Intern", bio: "The newest person on the team." } }
      response.status.should eq 201
      json["hero"]["first_name"].should eq "Johnny"
      json["hero"]["last_name"].should eq "New Guy"
      json["hero"]["title"].should eq "Intern"
      json["hero"]["bio"].should eq "The newest person on the team."
    end

    it "Unprocessable posts returns 422 (Unprocessable)" do
      post "/heroes", { hero: { first_name: nil } }
      response.status.should eq 422
      json['errors'].to_s.should include '{"first_name"=>["can\'t be blank"]}'
    end
  end
  
  describe "PUT /heroes" do
    before(:each) do
      @hero = create(:hero, first_name: "Johnny", last_name: "New Guy", title: "Intern", bio: "The newest person on the team.")
    end

    it "Updates a hero returns 204 (created)" do
      put "/heroes/#{@hero.id}", { hero: { title: "Intern Level II", bio: "No longer the newest person" } }
      response.status.should eq 204
      @hero.reload.title.should eq "Intern Level II"
      @hero.bio.should eq "No longer the newest person"
    end

    it "Unprocessable puts returns 422 (Unprocessable)" do
      put "/heroes/#{@hero.id}", { hero: { first_name: nil, title: "Intern Level II" } }
      response.status.should eq 422
      json['errors'].to_s.should include '{"first_name"=>["can\'t be blank"]}'
    end

    it "Returns 404 when id param not found" do
      put "/heroes/0", { hero: { first_name: 'Luke', title: "Jedi" } }
      response.status.should eq 404
    end
  end

end
