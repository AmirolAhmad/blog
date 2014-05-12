Rails.application.routes.draw do
  devise_for :users
  resources :articles

  #match 'about' => 'welcome#about', via: 'get'

  get 'welcome/about', controller: 'welcome', action: 'about'
  
  root to: 'articles#index'

end
