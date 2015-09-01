require 'rails_helper'

RSpec.describe "heroes/show", type: :view do
  before(:each) do
    @hero = assign(:hero, Hero.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :title => "Title",
      :bio => "MyText",
      :created_by => 1,
      :updated_by => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
