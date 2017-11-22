Rails.application.routes.draw do

  resources :restaurants do
    resources :reviews, only: [:new, :create]
  end

  root to: 'restaurants#index'
end
