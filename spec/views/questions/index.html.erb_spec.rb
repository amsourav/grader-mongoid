require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        :tag => "Tag",
        :mark => "Mark"
      ),
      Question.create!(
        :tag => "Tag",
        :mark => "Mark"
      )
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", :text => "Tag".to_s, :count => 2
    assert_select "tr>td", :text => "Mark".to_s, :count => 2
  end
end
