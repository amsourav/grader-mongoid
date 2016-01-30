require 'rails_helper'

RSpec.describe "student_profiles/edit", type: :view do
  before(:each) do
    @student_profile = assign(:student_profile, StudentProfile.create!(
      :name => "MyString",
      :roll => "MyString",
      :avatar => "MyString"
    ))
  end

  it "renders the edit student_profile form" do
    render

    assert_select "form[action=?][method=?]", student_profile_path(@student_profile), "post" do

      assert_select "input#student_profile_name[name=?]", "student_profile[name]"

      assert_select "input#student_profile_roll[name=?]", "student_profile[roll]"

      assert_select "input#student_profile_avatar[name=?]", "student_profile[avatar]"
    end
  end
end
