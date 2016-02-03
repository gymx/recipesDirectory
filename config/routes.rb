Rails.application.routes.draw do

  root   'recipes#home'
  get    'nav_search' => 'recipes#nav_search'
  get    'course'     => 'recipes#course'
  get    'about'      => 'recipes#about'
  get    'login' 		  => 'sessions#new'
  post   'login' 		  => 'sessions#create'
  delete 'logout'		  => 'sessions#destroy'

  resources :recipes
  resources :users

end
