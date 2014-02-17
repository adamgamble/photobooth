Photobooth::Application.routes.draw do
  root :to => "photo_sessions#index"
  resources :photo_sessions do
    get "/print" => "photo_sessions#print"
  end
end
