require 'rails_helper'

RSpec.describe "courses/edit", type: :view do
  before(:each) do
    @course = assign(:course, Course.create!(
      :code => "MyString",
      :name => "MyString",
      :semester => "MyString",
      :year => "MyString"
    ))
  end

  it "renders the edit course form" do
    render

    assert_select "form[action=?][method=?]", course_path(@course), "post" do

      assert_select "input#course_code[name=?]", "course[code]"

      assert_select "input#course_name[name=?]", "course[name]"

      assert_select "input#course_semester[name=?]", "course[semester]"

      assert_select "input#course_year[name=?]", "course[year]"
    end
  end
end
