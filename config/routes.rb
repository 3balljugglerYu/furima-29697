Rails.application.routes.draw do
  devise_for :users
    # resources :items, only: :index
    root to: "items#index"
    resources :items do
      resources :orders, only:[:index, :create]
    end
end
