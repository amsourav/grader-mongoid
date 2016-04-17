require 'rails_helper'

RSpec.describe "grades/index", type: :view do
  before(:each) do
    assign(:grades, [
      Grade.create!(),
      Grade.create!()
    ])
  end

  it "renders a list of grades" do
    render
  end
end
