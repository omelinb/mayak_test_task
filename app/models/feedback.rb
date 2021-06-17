class Feedback < ApplicationRecord
  validates :feedback_id, uniqueness: true
end
