Rails.application.routes.draw do

  resources :articles
  root to: 'articles#index'

  resources :shots, only: [:index, :create] do
    collection do
      get :index
      post :safe_spot
    end
  end



end
