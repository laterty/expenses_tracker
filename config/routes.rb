Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :expenses
  resources :expense_sharings, only: %i[index show delete create]
end
