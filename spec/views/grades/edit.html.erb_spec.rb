require 'rails_helper'

RSpec.describe "grades/edit", type: :view do
  before(:each) do
    @grade = assign(:grade, Grade.create!())
  end

  it "renders the edit grade form" do
    render

    assert_select "form[action=?][method=?]", grade_path(@grade), "post" do
    end
  end
end
