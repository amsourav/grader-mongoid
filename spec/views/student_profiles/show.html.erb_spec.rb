require 'rails_helper'

RSpec.describe "student_profiles/show", type: :view do
  before(:each) do
    @student_profile = assign(:student_profile, StudentProfile.create!(
      :name => "Name",
      :roll => "Roll",
      :avatar => "Avatar"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Roll/)
    expect(rendered).to match(/Avatar/)
  end
end
