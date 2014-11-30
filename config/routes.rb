Rails.application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :parents
  root to: "home#index"

  resources :schools do
    resources :events, only: [ :new, :create, :edit, :update ]
    end

  resources :camps do
    resources :kids, only: :index
  end

  resources :kids do
    resources :parentships
  end
end
