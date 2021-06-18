Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'feedbacks_activity/:imt_id', to: 'feedbacks#feedbacks_activity'
      get 'most_commented_this_week', to: 'feedbacks#most_commented_this_week'
    end
  end
end
