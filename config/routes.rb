Rails.application.routes.draw do


  get 'events/new'

  get 'events/create'

  get 'events/edit'

  get 'events/update'

  get 'events/index'

  get 'events/show'

  get 'events/destroy'

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
