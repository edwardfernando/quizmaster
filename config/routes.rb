Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :questions do
        collection do
          get :random, to: "quiz#random"
        end
        
        member do
          post :check_answer, to: "quiz#check_answer"
        end
      end
    end
  end

  get '/admin' => 'admin#index'
  root to: 'site#index'
end
