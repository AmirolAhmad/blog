Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy'
    get '/login' => 'devise/sessions#new'
  end
  resources :articles

  match 'about' => 'welcome#about', via: 'get'
  
  root to: 'articles#index'

end
