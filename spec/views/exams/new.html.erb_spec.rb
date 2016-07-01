require 'rails_helper'

RSpec.describe "exams/new", type: :view do
  before(:each) do
    assign(:exam, Exam.new(
      :name => "MyString",
      :date => "MyString"
    ))
  end

  it "renders new exam form" do
    render

    assert_select "form[action=?][method=?]", exams_path, "post" do

      assert_select "input#exam_name[name=?]", "exam[name]"

      assert_select "input#exam_date[name=?]", "exam[date]"
    end
  end
end
