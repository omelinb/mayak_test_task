namespace :wildberries do
  task collect_feedback: :environment do
    FeedbackCollectorService.call
  end
end
