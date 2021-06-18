class FeedbackCollectorService < ApplicationService
  FEEDBACK_URL = 'https://public-feedbacks.wildberries.ru/api/v1/feedbacks'
  QUERY_PARAMS = {
    skip: 0,
    imtId: ENV['IMTID'].to_i,
    order: 'dateDesc',
    take: 10
  }.to_json

  def call
    response = Faraday.post(FEEDBACK_URL, QUERY_PARAMS)
    return unless response.status == 200

    puts "Collect feedbacks for product with imt_id #{ENV['IMTID']}."

    feedbacks = JSON.parse(response.body)['feedbacks']

    puts "We got #{feedbacks.size} feedbacks."

    save_feedbacks(feedbacks)
  end
  
  private
  
  def save_feedbacks(feedbacks)
    Feedback.create(feedbacks.map do |f|
      {
        feedback_id: f['id'],
        imt_id:      f['imtId'],
        wb_user_id:  f['wbUserId'],
        rank:        f['rank'],
        left_at:     f['createdDate']
      }
    end)
  end
end
