require 'spec_helper'

RSpec.describe HeroSchedule, type: :model do
  describe "Validation tests" do
    it "Only one hero can be scheduled per day" do
      hero = create(:hero, :random)
      create(:hero_schedule, :today, hero: hero).should be_valid
      build(:hero_schedule, :today, hero: hero).should_not be_valid
    end
    it "Hero is required" do
      build(:hero_schedule, :today).should_not be_valid
    end
    it "Scheduled on date is required" do
      hero = create(:hero, :random)
      build(:hero_schedule, scheduled_on: nil, hero: hero).should_not be_valid
    end
  end
end
