Rails.application.routes.draw do
  
  root "pages#home"
  get 'pages/home', to: 'pages#home'

  resources :recipes
#the info below no longer needs to be entered due to the line above
  #get '/recipes' , to: 'recipes#index'
  #get '/recipes/new' , to: 'recipes#new' , as: 'new_recipe'
  #get '/recipes/:id' , to: 'recipes#show' , as: 'recipe'
  #post '/recipes', to: 'recipes#create'

end
