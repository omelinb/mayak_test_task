Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      scope :feedbacks do
        get 'activity/:imt_id', to: 'feedbacks#activity'
        get 'most_this_week', to: 'feedbacks#most_this_week'
      end
    end
  end
end
