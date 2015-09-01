require 'rails_helper'

RSpec.describe "hero_schedules/edit", type: :view do
  before(:each) do
    @hero_schedule = assign(:hero_schedule, HeroSchedule.create!(
      :hero => nil,
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders the edit hero_schedule form" do
    render

    assert_select "form[action=?][method=?]", hero_schedule_path(@hero_schedule), "post" do

      assert_select "input#hero_schedule_hero_id[name=?]", "hero_schedule[hero_id]"

      assert_select "input#hero_schedule_created_by[name=?]", "hero_schedule[created_by]"

      assert_select "input#hero_schedule_updated_by[name=?]", "hero_schedule[updated_by]"
    end
  end
end
