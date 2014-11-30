Rails.application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :parents
  root to: "home#index"
  resources :schools
  resources :camps
  resources :kids do
    resources :parentships
  end
end
