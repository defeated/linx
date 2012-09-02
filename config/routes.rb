Linx::Application.routes.draw do
  resources :links, only: [:index, :show, :create]
  match "/:year(/:month(/:day))" => "links#index"
end
