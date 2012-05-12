Cont24::Application.routes.draw do
  resources :anniversaries

  get "/auth/:provider/callback" => "sessions#callback"
  get "/logout" => "sessions#destroy", :as => :logout
end
