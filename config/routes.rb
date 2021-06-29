Rails.application.routes.draw do
    root 'pages#home'
    resources :articles
    resources :events
    get '/events/:id/register',  to: 'events#register', as: 'event_reg'
    post '/events/:id',  to: 'events#register1', as: 'event_register'
    resources :comments 
    resources :articles do
        resources :likes
    end
    resources :articles do
        resources :dislikes
    end
    get 'signup', to: 'users#new'
    resources :users, except: [:new]
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    resources :categories, except: [:destroy]
end