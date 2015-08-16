Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :projects do
    resources :tasks
  end
  
end
