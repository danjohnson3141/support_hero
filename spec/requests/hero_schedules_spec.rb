require 'spec_helper'

RSpec.describe "HeroSchedules", type: :request do
  describe "GET /hero_schedules" do
    it "works! (now write some real specs)" do
      get hero_schedules_path
      expect(response).to have_http_status(200)
    end
  end
end
