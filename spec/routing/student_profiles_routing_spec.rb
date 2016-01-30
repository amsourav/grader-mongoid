require "rails_helper"

RSpec.describe StudentProfilesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/student_profiles").to route_to("student_profiles#index")
    end

    it "routes to #new" do
      expect(:get => "/student_profiles/new").to route_to("student_profiles#new")
    end

    it "routes to #show" do
      expect(:get => "/student_profiles/1").to route_to("student_profiles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/student_profiles/1/edit").to route_to("student_profiles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/student_profiles").to route_to("student_profiles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/student_profiles/1").to route_to("student_profiles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/student_profiles/1").to route_to("student_profiles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/student_profiles/1").to route_to("student_profiles#destroy", :id => "1")
    end

  end
end
