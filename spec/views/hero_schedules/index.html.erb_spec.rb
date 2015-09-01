require 'rails_helper'

RSpec.describe "hero_schedules/index", type: :view do
  before(:each) do
    assign(:hero_schedules, [
      HeroSchedule.create!(
        :hero => nil,
        :created_by => 1,
        :updated_by => 2
      ),
      HeroSchedule.create!(
        :hero => nil,
        :created_by => 1,
        :updated_by => 2
      )
    ])
  end

  it "renders a list of hero_schedules" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
