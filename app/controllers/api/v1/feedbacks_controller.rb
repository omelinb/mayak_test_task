class Api::V1::FeedbacksController < ApplicationController
  def feedbacks_activity
    feedbacks = Feedback.where(imt_id: params[:imt_id]).recent(30)
    grouped_feedbacks = feedbacks.group_by_day(:left_at).count
    render json: grouped_feedbacks
  end

  def most_commented_this_week
    feedbacks_by_product = Feedback.recent(7).group(:imt_id).count
    most_commented_products = feedbacks_by_product.sort_by { |k, v| v }.last(10).to_h
    render json: most_commented_products
  end
end
