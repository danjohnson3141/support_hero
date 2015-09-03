require 'spec_helper'

RSpec.describe "HeroSchedules", type: :request do
  describe "GET /hero_schedules" do

    before(:all) do
      @hero1 = create(:hero, :random, first_name: 'Dan', last_name: 'Johnson')
      @hero2 = create(:hero, :random, first_name: 'Zack', last_name: 'Andrews')
      @hero3 = create(:hero, :random, first_name: 'Richard', last_name: 'Garriot')
      @hero_schedule1 = create(:hero_schedule, scheduled_on: Time.now, hero: @hero1)
      @hero_schedule2 = create(:hero_schedule, scheduled_on: 1.day.from_now, hero: @hero2)
      @hero_schedule3 = create(:hero_schedule, scheduled_on: 2.day.from_now, hero: @hero1)
      @holiday = create(:holiday, holiday_date: 1.day.from_now, name: 'New Relic Day')
    end

    describe "GET /hero_schedules/current/:unit_of_time" do
      it "Returns all schedules for this week" do
        get "/hero_schedules/current/week"
        response.status.should eq 200
        # json["hero_schedules"].count.should eq 1
        # json['hero_schedules'][0]['id'].should eq @hero_schedule3.id
      end
      it "Returns all schedules for this month" do
        get "/hero_schedules/current/month"
        response.status.should eq 200
        # json["hero_schedules"].count.should eq 1
        # json['hero_schedules'][0]['id'].should eq @hero_schedule3.id
      end
      it "Returns all schedules for this year" do
        get "/hero_schedules/current/year"
        response.status.should eq 200
        # json["hero_schedules"].count.should eq 1
        # json['hero_schedules'][0]['id'].should eq @hero_schedule3.id
      end
      it "invalid unit_of_time returns 422" do
        get "/hero_schedules/current/epoch"
        response.status.should eq 422
      end
    end

    it "Returns hero_schedules" do
      get "/hero_schedules"
      response.status.should eq 200
      json["hero_schedules"].count.should eq 3
      json['hero_schedules'][0]['id'].should eq @hero_schedule1.id
      json['hero_schedules'][0]['weekend'].should eq @hero_schedule1.weekend?
      json['hero_schedules'][0]['holiday'].should eq nil
      json['hero_schedules'][0]['hero']['id'].should eq @hero_schedule1.hero.id
      json['hero_schedules'][0]['hero']['first_name'].should eq @hero_schedule1.hero.first_name
      json['hero_schedules'][0]['hero']['last_name'].should eq @hero_schedule1.hero.last_name
      json['hero_schedules'][1]['id'].should eq @hero_schedule2.id
      json['hero_schedules'][1]['holiday']['id'].should eq @holiday.id
      json['hero_schedules'][2]['id'].should eq @hero_schedule3.id
    end

    it "Returns all schedules on or after a certain date" do
      start_date = 2.day.from_now.to_s
      get "/hero_schedules?start_date=#{start_date}"
      response.status.should eq 200
      json["hero_schedules"].count.should eq 1
      json['hero_schedules'][0]['id'].should eq @hero_schedule3.id
    end

    it "Returns all schedules on or before a certain date" do
      end_date = 1.day.from_now.to_s
      get "/hero_schedules?end_date=#{end_date}"
      response.status.should eq 200
      json["hero_schedules"].count.should eq 2
      json['hero_schedules'][0]['id'].should eq @hero_schedule1.id
      json['hero_schedules'][1]['id'].should eq @hero_schedule2.id
    end

    it "Returns all schedules between date range" do
      start_date = 1.day.from_now.to_s
      end_date = 1.day.from_now.to_s
      get "/hero_schedules?start_date=#{start_date}&end_date=#{end_date}"
      response.status.should eq 200
      json["hero_schedules"].count.should eq 1
      json['hero_schedules'][0]['id'].should eq @hero_schedule2.id
    end

    it "Returns single hero_schedule matching id param" do
      get "/hero_schedules/#{@hero_schedule1.id}"
      response.status.should eq 200
      json['hero_schedule']['id'].should eq @hero_schedule1.id
      json['hero_schedule']['hero']['id'].should eq @hero_schedule1.hero.id
      json['hero_schedule']['hero']['first_name'].should eq @hero_schedule1.hero.first_name
      json['hero_schedule']['hero']['last_name'].should eq @hero_schedule1.hero.last_name
    end

    it "Returns 404 when id param not found" do
      get "/hero_schedules/0"
      response.status.should eq 404
    end
  end
  
  describe "POST /hero_schedules" do
    it "Creating a new hero_schedule returns that hero_schedule's data and 201 (created)" do
      @hero = create(:hero, :random, first_name: 'Dan', last_name: 'Johnson')
      post "/hero_schedules", { hero_schedule: { scheduled_on: '2015-10-07', hero_id: @hero.id } }
      response.status.should eq 201
      json['hero_schedule']['scheduled_on'].should eq '2015-10-07'
      json['hero_schedule']['hero']['id'].should eq @hero.id
      json['hero_schedule']['hero']['first_name'].should eq @hero.first_name
      json['hero_schedule']['hero']['last_name'].should eq @hero.last_name
    end

    it "Unprocessable if same hero is scheduled twice on the same day" do
      hero_schedule = create(:hero_schedule, :random)
      post "/hero_schedules", { hero_schedule: { scheduled_on: hero_schedule.scheduled_on, hero_id: hero_schedule.hero.id } }
      response.status.should eq 422
      json['errors'].to_s.should include '{"hero_id"=>["has already been taken"]}'
    end
  end
  
  describe "PUT /hero_schedules" do
    before(:each) do
      @hero = create(:hero, :random, first_name: 'Dan', last_name: 'Johnson')
      @hero_schedule = create(:hero_schedule, :random, scheduled_on: 12.day.from_now)
    end

    it "Updates a hero_schedule returns 204 (created)" do
      put "/hero_schedules/#{@hero_schedule.id}", { hero_schedule: { scheduled_on: 7.day.from_now.to_s, hero_id: @hero.id } }
      response.status.should eq 204
    end

    it "Unprocessable puts returns 422 (Unprocessable)" do
      put "/hero_schedules/#{@hero_schedule.id}", { hero_schedule: { scheduled_on: nil, hero_id: @hero.id } }
      response.status.should eq 422
      # json['errors'].to_s.should include '{"first_name"=>["can\'t be blank"]}'
    end

    it "Returns 404 when id param not found" do
      put "/hero_schedules/0", { hero_schedule: { hero_id: 2 } }
      response.status.should eq 404
    end
  end
end
