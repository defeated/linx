Linx::Application.routes.draw do
  resources :links, only: [:index, :show, :create]

  match "/auth/:provider/callback", to: "sessions#create"

  root to: "links#index"
end
