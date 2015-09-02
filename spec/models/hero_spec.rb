require 'spec_helper'

RSpec.describe Hero, type: :model do
  describe "Validation tests" do
    it "First name is a required field" do
      build(:hero, first_name: nil).should_not be_valid
    end
  end
end
