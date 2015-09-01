require 'spec_helper'

RSpec.describe "Heroes", type: :request do
  describe "GET /heroes" do
    
    before(:all) do
      @hero1 = create(:hero, :random, first_name: 'Dan', last_name: 'Johnson')
      @hero2 = create(:hero, :random, first_name: 'Zack', last_name: 'Andrews')
      @hero3 = create(:hero, :random, first_name: 'Richard', last_name: 'Garriot')
    end

    it "Returns all heroes sorted by last_name, first_name" do
      get "/heroes"
      response.status.should eq 200
      json["heroes"].count.should eq 3
      json["heroes"][0]["id"].should eq @hero2.id
      json["heroes"][0]["first_name"].should eq @hero2.first_name
      json["heroes"][0]["last_name"].should eq @hero2.last_name
      json["heroes"][0]["title"].should eq @hero2.title
      json["heroes"][0]["bio"].should eq @hero2.bio
      json["heroes"][1]["id"].should eq @hero3.id
      json["heroes"][2]["id"].should eq @hero1.id
    end
  end

  describe "GET /heroes/:id" do
    it "Returns single hero matching id param" do
      hero = create(:hero, :random)
      get "/heroes/#{hero.id}"
      response.status.should eq 200
      json["hero"]["id"].should eq hero.id
      json["hero"]["first_name"].should eq hero.first_name
      json["hero"]["last_name"].should eq hero.last_name
      json["hero"]["title"].should eq hero.title
      json["hero"]["bio"].should eq hero.bio
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
