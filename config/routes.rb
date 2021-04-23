Rails.application.routes.draw do
  namespace :monitoring do
    get :health_check
    get :heart_beat
  end
end
