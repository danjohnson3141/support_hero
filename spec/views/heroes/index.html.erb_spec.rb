require 'rails_helper'

RSpec.describe "heroes/index", type: :view do
  before(:each) do
    assign(:heroes, [
      Hero.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :title => "Title",
        :bio => "MyText",
        :created_by => 1,
        :updated_by => 2
      ),
      Hero.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :title => "Title",
        :bio => "MyText",
        :created_by => 1,
        :updated_by => 2
      )
    ])
  end

  it "renders a list of heroes" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
