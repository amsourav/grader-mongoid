require 'rails_helper'

RSpec.describe "exams/index", type: :view do
  before(:each) do
    assign(:exams, [
      Exam.create!(
        :name => "Name",
        :date => "Date"
      ),
      Exam.create!(
        :name => "Name",
        :date => "Date"
      )
    ])
  end

  it "renders a list of exams" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Date".to_s, :count => 2
  end
end
