Rails.application.routes.draw do

  get 'profiles/show'

  get 'home/contact'

  mount RailsAdmin::Engine => '/admin_2', as: 'rails_admin'


  ActiveAdmin.routes(self)

  devise_for :parents
  root to: "home#index"

  resources :schools do
    resources :events, only: [ :new, :create, :edit, :update, :index, :show, :destroy ]
    resources :adverts
  end

  resources :camps do
    resources :kids, only: :index
    resources :informations
  end

  resources :kids do
    resources :parentships
  end
end
