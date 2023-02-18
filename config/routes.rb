Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :categories, only: %i[show] do
    resources :expenses, only: %i[index]
  end
  resources :expenses
  resources :expense_sharings, except: %i[update edit]
end
