Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html  
  devise_for :users
  resources :novels do
    resources :articles
  end  
  root to: "novels#index"
end
