Rails.application.routes.draw do
  devise_for :users
  root to: "commodities#index"
  resources :commodities, only: [:new, :create, :show] do
  end
end
