Rails.application.routes.draw do
  devise_for :users
  root to: "displays#index"
end
