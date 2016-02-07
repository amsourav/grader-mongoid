require 'rails_helper'

RSpec.describe "courses/new", type: :view do
  before(:each) do
    assign(:course, Course.new(
      :code => "MyString",
      :name => "MyString",
      :semester => "MyString",
      :year => "MyString"
    ))
  end

  it "renders new course form" do
    render

    assert_select "form[action=?][method=?]", courses_path, "post" do

      assert_select "input#course_code[name=?]", "course[code]"

      assert_select "input#course_name[name=?]", "course[name]"

      assert_select "input#course_semester[name=?]", "course[semester]"

      assert_select "input#course_year[name=?]", "course[year]"
    end
  end
end
