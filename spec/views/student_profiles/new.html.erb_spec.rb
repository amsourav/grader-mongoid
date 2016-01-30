require 'rails_helper'

RSpec.describe "student_profiles/new", type: :view do
  before(:each) do
    assign(:student_profile, StudentProfile.new(
      :name => "MyString",
      :roll => "MyString",
      :avatar => "MyString"
    ))
  end

  it "renders new student_profile form" do
    render

    assert_select "form[action=?][method=?]", student_profiles_path, "post" do

      assert_select "input#student_profile_name[name=?]", "student_profile[name]"

      assert_select "input#student_profile_roll[name=?]", "student_profile[roll]"

      assert_select "input#student_profile_avatar[name=?]", "student_profile[avatar]"
    end
  end
end
