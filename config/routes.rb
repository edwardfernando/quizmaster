Rails.application.routes.draw do
  namespace :api do
    namespace :quiz do
      resources :questions
    end
  end
  
  get '/admin' => 'admin#index'
  root to: 'site#index'
end
