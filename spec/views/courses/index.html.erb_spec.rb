require 'rails_helper'

RSpec.describe "courses/index", type: :view do
  before(:each) do
    assign(:courses, [
      Course.create!(
        :code => "Code",
        :name => "Name",
        :semester => "Semester",
        :year => "Year"
      ),
      Course.create!(
        :code => "Code",
        :name => "Name",
        :semester => "Semester",
        :year => "Year"
      )
    ])
  end

  it "renders a list of courses" do
    render
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Semester".to_s, :count => 2
    assert_select "tr>td", :text => "Year".to_s, :count => 2
  end
end
