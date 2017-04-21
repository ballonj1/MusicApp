Rails.application.routes.draw do
  get 'albums/new'

  get 'albums/create'

  get 'albums/edit'

  get 'albums/show'

  get 'albums/destroy'

  get 'albums/update'

  get 'bands/resources'

  resources :users, only: [:create, :new, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :sessions, only: [:create, :new, :show, :destroy]

  resources :bands
  resources :albums, except: [:index]
  resources :tracks, except: [:index]
end
