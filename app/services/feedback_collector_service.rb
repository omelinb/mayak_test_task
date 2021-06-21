class FeedbackCollectorService < ApplicationService
  FEEDBACK_URL = 'https://public-feedbacks.wildberries.ru/api/v1/feedbacks'

  def call    
    puts "Collect feedbacks for product with imt_id #{ENV['IMTID']}."

    skip = 0
    loop do
      response = Faraday.post(FEEDBACK_URL, query_params(skip))

      if response.status != 200
        puts "Something went wrong. Response status code is #{response.status}."
        return
      end

      feedbacks = JSON.parse(response.body)['feedbacks']

      return if feedbacks.empty?

      save_feedbacks(feedbacks)
      skip += 10
    end
  end
  
  private
  
  def query_params(skip)
    imt_id = ENV['IMTID'].to_i

    {
      skip: skip,
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
