Rails.application.routes.draw do
 root 'trips#index'

 devise_for :users

 resources :trips do 
  resources :locations
  end

 resources :locations do 
  resources :addresses
  end
  resources :trips do
    resources :reviews
  end
end
