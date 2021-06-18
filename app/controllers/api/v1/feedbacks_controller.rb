class Api::V1::FeedbacksController < ApplicationController
  def feedbacks_activity
    feedbacks = Feedback.where(imt_id: params[:imt_id]).recent(30)
    render json: feedbacks.group_by_day(:left_at).count
  end

  def most_commented_in_week
    feedbacks_by_product = Feedback.recent(7).group(:imt_id).count
    render json: feedbacks_by_product.sort_by { |k, v| v }.last(10).to_h
  end
end
