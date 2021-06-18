class Feedback < ApplicationRecord
  scope :recent, -> (days) { where('left_at > ?', days.days.ago) }

  validates :feedback_id, uniqueness: true
end
