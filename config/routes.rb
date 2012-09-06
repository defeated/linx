Linx::Application.routes.draw do
  root to: "links#index"
  resources :links, only: [:index, :show, :create]
  match "/auth/:provider/callback" => "sessions#create"
  get "/:from" => "links#index", constraints: {
    from: /(today|yesterday|last-week|last-month)/ }
end
