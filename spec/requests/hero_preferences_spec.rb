require 'spec_helper'

RSpec.describe "HeroPreferences", type: :request do
  describe "GET /hero_preferences" do
    it "works! (now write some real specs)" do
      get hero_preferences_path
      expect(response).to have_http_status(200)
    end
  end
end
