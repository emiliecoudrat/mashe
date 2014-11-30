Rails.application.routes.draw do


  get 'schools/new'

  get 'schools/create'

  get 'schools/update'

  get 'schools/edit'

  get 'schools/destroy'

  get 'schools/index'

  get 'schools/show'

  ActiveAdmin.routes(self)

  devise_for :parents
  root to: "home#index"
  resources :camps
  resources :kids do
    resources :parentships
  end
end
