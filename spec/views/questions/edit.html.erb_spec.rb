require 'rails_helper'

RSpec.describe "questions/edit", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      :tag => "MyString",
      :mark => "MyString"
    ))
  end

  it "renders the edit question form" do
    render

    assert_select "form[action=?][method=?]", question_path(@question), "post" do

      assert_select "input#question_tag[name=?]", "question[tag]"

      assert_select "input#question_mark[name=?]", "question[mark]"
    end
  end
end
