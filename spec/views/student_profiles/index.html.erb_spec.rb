require 'rails_helper'

RSpec.describe "student_profiles/index", type: :view do
  before(:each) do
    assign(:student_profiles, [
      StudentProfile.create!(
        :name => "Name",
        :roll => "Roll",
        :avatar => "Avatar"
      ),
      StudentProfile.create!(
        :name => "Name",
        :roll => "Roll",
        :avatar => "Avatar"
      )
    ])
  end

  it "renders a list of student_profiles" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Roll".to_s, :count => 2
    assert_select "tr>td", :text => "Avatar".to_s, :count => 2
  end
end
