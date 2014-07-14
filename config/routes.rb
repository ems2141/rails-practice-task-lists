Rails.application.routes.draw do
  root "task_lists#index"
  resources :task_lists do
    resources :tasks
  end

  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout
end
