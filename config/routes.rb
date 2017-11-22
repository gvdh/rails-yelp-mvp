Rails.application.routes.draw do

  resources :restaurants do
    resources :reviews, only: [:new, :create]
    collection do                       # collection => no restaurant id in URL
      get 'top', to: "restaurants#top"  # RestaurantsController#top
    end
  end


  root to: 'restaurants#index'
end
