Rails.application.routes.draw do

 root 'trips#index'

 devise_for :users do
  resources :trips
 end
 
 get 'trips/random', to: 'trips#random'

resources :trips, shallow: true do
  resources :locations, shallow: true do
    resources :addresses, shallow: true
  end
end

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
