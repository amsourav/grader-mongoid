require 'rails_helper'

RSpec.describe "exams/edit", type: :view do
  before(:each) do
    @exam = assign(:exam, Exam.create!(
      :name => "MyString",
      :date => "MyString"
    ))
  end

  it "renders the edit exam form" do
    render

    assert_select "form[action=?][method=?]", exam_path(@exam), "post" do

      assert_select "input#exam_name[name=?]", "exam[name]"

      assert_select "input#exam_date[name=?]", "exam[date]"
    end
  end
end