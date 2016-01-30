require 'rails_helper'

RSpec.describe "StudentProfiles", type: :request do
  describe "GET /student_profiles" do
    it "works! (now write some real specs)" do
      get student_profiles_path
      expect(response).to have_http_status(200)
    end
  end
end
