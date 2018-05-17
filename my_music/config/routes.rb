Rails.application.routes.draw do
  get 'album/index'

  resources :album

  root 'album#index'
end
