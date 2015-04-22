MusicApp::Application.routes.draw do
  resource :session, only: [:create, :new, :destroy]

  resources :users, only: [:create, :new, :show]
  resources :bands do
    resources :albums, only: [:new]
  end
  resources :albums, except: [:new, :index] do
    resources :tracks, only: [:new]
  end
  resources :tracks, except: [:new, :index]
end
