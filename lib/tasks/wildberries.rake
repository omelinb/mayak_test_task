namespace :wildberries do
  task collect_feedback: :environment do
    FeedbackCollector.call
  end
end
