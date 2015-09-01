require 'rails_helper'

RSpec.describe "hero_schedules/show", type: :view do
  before(:each) do
    @hero_schedule = assign(:hero_schedule, HeroSchedule.create!(
      :hero => nil,
      :created_by => 1,
      :updated_by => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
