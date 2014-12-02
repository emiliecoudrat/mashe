Rails.application.routes.draw do


    get 'home/contact'
    resources :adverts

  ActiveAdmin.routes(self)

  devise_for :parents
  root to: "home#index"

  resources :schools do
    resources :events, only: [ :new, :create, :edit, :update, :index, :show, :destroy ]
    end

  resources :camps do
    resources :kids, only: :index
    resources :informations
  end

  resources :kids do
    resources :parentships
  end
end
