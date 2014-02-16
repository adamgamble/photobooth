Photobooth::Application.routes.draw do
  root :to => "photo_sessions#index"
  resources :photo_sessions
end
