Rails.application.routes.draw do
    resources :adverts
    resources :schools

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
