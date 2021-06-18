class FeedbackCollectorService < ApplicationService
  FEEDBACK_URL = 'https://public-feedbacks.wildberries.ru/api/v1/feedbacks'

  def call
    response = Faraday.post(FEEDBACK_URL, query_params)
    return unless response.status == 200

    puts "Collect feedbacks for product with imt_id #{ENV['IMTID']}."

    feedbacks = JSON.parse(response.body)['feedbacks']

    save_feedbacks(feedbacks)
  end
  
  private
  
  def query_params
    imt_id = ENV['IMTIDZ'].to_i

    {
      skip: 0,
      imtId: imt_id,
      order: 'dateDesc',
      take: 10
    }.to_json
  end

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
