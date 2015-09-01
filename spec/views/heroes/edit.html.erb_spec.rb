require 'rails_helper'

RSpec.describe "heroes/edit", type: :view do
  before(:each) do
    @hero = assign(:hero, Hero.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :title => "MyString",
      :bio => "MyText",
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders the edit hero form" do
    render

    assert_select "form[action=?][method=?]", hero_path(@hero), "post" do

      assert_select "input#hero_first_name[name=?]", "hero[first_name]"

      assert_select "input#hero_last_name[name=?]", "hero[last_name]"

      assert_select "input#hero_title[name=?]", "hero[title]"

      assert_select "textarea#hero_bio[name=?]", "hero[bio]"

      assert_select "input#hero_created_by[name=?]", "hero[created_by]"

      assert_select "input#hero_updated_by[name=?]", "hero[updated_by]"
    end
  end
end
