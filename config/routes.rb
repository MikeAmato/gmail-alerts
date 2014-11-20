# config/routes.rb
GmailAlerts::Application.routes.draw do
  root to: 'sessions#create'
  resources :sessions, only: :index
  get "/auth/:provider/callback" => 'sessions#create'
end