Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      scope :feedbacks do
        get 'most_this_week', to: 'feedbacks#most_this_week'
        get 'activity',       to: 'feedbacks#activity'
      end
    end
  end
end
