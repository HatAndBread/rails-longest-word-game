Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"

  get '/home', to: "pages#home"
  get '/new', to: "pages#new"
  post '/score', to: "pages#score"
  get '/score', to: "pages#score"
end
