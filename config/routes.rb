Rails.application.routes.draw do
  devise_for :parents
  root to: "home#index"
  resources :kids do
    resources :parentships
  end
end
