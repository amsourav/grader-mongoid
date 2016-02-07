require 'rails_helper'

RSpec.describe "exams/show", type: :view do
  before(:each) do
    @exam = assign(:exam, Exam.create!(
      :name => "Name",
      :date => "Date"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Date/)
  end
end
