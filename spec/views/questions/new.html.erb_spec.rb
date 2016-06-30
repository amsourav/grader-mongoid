require 'rails_helper'

RSpec.describe "questions/new", type: :view do
  before(:each) do
    assign(:question, Question.new(
      :tag => "MyString",
      :mark => "MyString"
    ))
  end

  it "renders new question form" do
    render

    assert_select "form[action=?][method=?]", questions_path, "post" do

      assert_select "input#question_tag[name=?]", "question[tag]"

      assert_select "input#question_mark[name=?]", "question[mark]"
    end
  end
end
