Linx::Application.routes.draw do
  resources :links, only: [:index, :show, :create]
end
