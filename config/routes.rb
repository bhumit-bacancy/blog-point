Rails.application.routes.draw do
  root "pages#home"
  resources :sessions, only: [:create]
  resources :articles, except: [:edit]
  resources :registrations, only: [:create]
  resources :users, only: [:show]
  get "user_articles/:id", to: "users#user_articles"
  post :change_password, to: "users#change_password"
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
end
