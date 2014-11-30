Rails.application.routes.draw do


  get 'guests/destroy'

  get 'guests/new'

  get 'guests/create'

  get 'guests/index'

  get 'guests/show'

  get 'guests/edit'

  get 'guests/update'

  get 'guests/delete'

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
