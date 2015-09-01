require 'rails_helper'

RSpec.describe "heroes/new", type: :view do
  before(:each) do
    assign(:hero, Hero.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :title => "MyString",
      :bio => "MyText",
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders new hero form" do
    render

    assert_select "form[action=?][method=?]", heroes_path, "post" do

      assert_select "input#hero_first_name[name=?]", "hero[first_name]"

      assert_select "input#hero_last_name[name=?]", "hero[last_name]"

      assert_select "input#hero_title[name=?]", "hero[title]"

      assert_select "textarea#hero_bio[name=?]", "hero[bio]"

      assert_select "input#hero_created_by[name=?]", "hero[created_by]"

      assert_select "input#hero_updated_by[name=?]", "hero[updated_by]"
    end
  end
end
