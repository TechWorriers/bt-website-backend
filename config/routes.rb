Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :feedbacks
      resources :transactions, only: %i[index create]
    end
  end
end
