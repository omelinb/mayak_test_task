class FeedbackCollector < ApplicationService
  FEEDBACK_URL = 'https://public-feedbacks.wildberries.ru/api/v1/feedbacks'
  QUERY_PARAMS = {
    skip: 0,
    imtId: ENV['IMTID'].to_i,
    order: 'dateDesc',
    take: 10
  }.to_json

  def call
    response = Faraday.post(FEEDBACK_URL, QUERY_PARAMS)
    # byebug
    puts response
  end
end
