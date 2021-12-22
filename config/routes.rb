Rails.application.routes.draw do
  root to: 'splash_screen#show'
  devise_for :users
  resources :users do
    resources :groups do
      resources :entities
   end   
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
