Rails.application.routes.draw do
  devise_for :users
  root to: "commodities#index"
  resources :commodities do
    resources :orders, only: [:index, :create]
  end
end
