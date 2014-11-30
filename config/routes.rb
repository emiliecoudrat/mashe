Rails.application.routes.draw do


  ActiveAdmin.routes(self)

  devise_for :parents
  root to: "home#index"

  resources :camps do
    resources :kids, only: :index
  end

  resources :events do
    resources :guests
  end

  resources :kids do
    resources :parentships
  end
end
