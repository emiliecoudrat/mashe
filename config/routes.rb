Rails.application.routes.draw do
  get 'camp/new'

  get 'camp/create'

  get 'camp/index'

  get 'camp/show'

  get 'camp/edit'

  get 'camp/update'

  get 'camp/destroy'

  ActiveAdmin.routes(self)

  devise_for :parents
  root to: "home#index"

  resources :kids do
    resources :parentships
  end
end
