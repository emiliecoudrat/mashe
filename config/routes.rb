Rails.application.routes.draw do

# seb : ici nester adverts dans school
  resources :adverts do
    resources :schools
end

  ActiveAdmin.routes(self)

  devise_for :parents
  root to: "home#index"

  resources :camps do
    resources :kids, only: :index
  end

  resources :kids do
    resources :parentships
  end
end
