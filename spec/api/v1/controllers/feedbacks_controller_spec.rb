require "rails_helper"

RSpec.describe Api::V1::FeedbacksController, :type => :controller do
  describe "GET activity/:itm_id" do
    it "has a 200 status code" do
      get 'activity'
      expect(response.status).to eq(200)
    end
  end

  describe "GET most_this_week" do
    it "has a 200 status code" do
      get 'most_this_week'
      expect(response.status).to eq(200)
    end
  end
end
