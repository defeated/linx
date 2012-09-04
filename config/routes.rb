Linx::Application.routes.draw do
  resources :links, only: [:index, :show, :create]

  match "/auth/:provider/callback", to: "sessions#create", as: "auth_callback"

  match "/:year(/:month(/:day))", to: "links#index", constraints: {
    year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/
  }
end
