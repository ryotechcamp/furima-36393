Rails.application.routes.draw do
  devise_for :users
  root to: "displays#index"
  resources :displays do
    resources :purchases, only: [:index, :create] 
  end
end
