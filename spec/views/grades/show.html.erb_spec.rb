require 'rails_helper'

RSpec.describe "grades/show", type: :view do
  before(:each) do
    @grade = assign(:grade, Grade.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
