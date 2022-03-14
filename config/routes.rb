Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "reads#index"
  get "reads/new", to: "reads#new"
  post "reads/new", to: "reads#create"
end
