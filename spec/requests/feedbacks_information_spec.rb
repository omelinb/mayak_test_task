require "rails_helper"

RSpec.describe "Feedbacks information", :type => :request do
  it "returns 10 products with most feedbacks this week" do
    Feedback.create((1..20).map do |i|
      (1..i).map do |j|
        { imt_id: i, feedback_id: "feedback_id-#{i}-#{j}", left_at: DateTime.now }
      end
    end.flatten)
    get "/api/v1/feedbacks/most_this_week"
    expect(response.body).to eq("{\"20\":20,\"19\":19,\"18\":18,\"17\":17,\"16\":16,\"15\":15,\"14\":14,\"13\":13,\"12\":12,\"11\":11}")
  end
  
  it "returns feedbacks count for each day for last 30 days" do
    Feedback.create(imt_id: 1, feedback_id: 1, left_at: DateTime.now)
    get "/api/v1/feedbacks/activity", :params => { :imt_id => 1 }
    expect(response.body).to eq("{\"#{DateTime.now.strftime('%Y-%m-%d')}\":1}")
  end
end
