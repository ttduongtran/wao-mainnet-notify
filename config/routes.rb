Rails.application.routes.draw do

  root "monikers#index"
  resources :notify_logs
  resources :monikers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'
  mount Sidekiq::Web => '/sidekiq_web'
  get 'sidekiq', to: 'sidekiq#index'
  
end
