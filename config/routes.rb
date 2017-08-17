Rails.application.routes.draw do
  
  root "pages#home"
  get 'pages/home', to: 'pages#home'

  resources :recipes
#the info below no longer needs to be entered due to the line above
  #get '/recipes' , to: 'recipes#index'
  #get '/recipes/new' , to: 'recipes#new' , as: 'new_recipe'
  #get '/recipes/:id' , to: 'recipes#show' , as: 'recipe'
  #post '/recipes', to: 'recipes#create'

  get '/signup', to: 'chefs#new'
  resources :chefs, except: [:new]
  #The line above will give all the routes except for the new route
  #since we want to use /signup route instead of /chefs/new
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
