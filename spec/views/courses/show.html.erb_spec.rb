require 'rails_helper'

RSpec.describe "courses/show", type: :view do
  before(:each) do
    @course = assign(:course, Course.create!(
      :code => "Code",
      :name => "Name",
      :semester => "Semester",
      :year => "Year"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Semester/)
    expect(rendered).to match(/Year/)
  end
end
