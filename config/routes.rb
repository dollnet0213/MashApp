Rails.application.routes.draw do
  get 'post/new'
  #userアクション
  get '/signup' => "users#new"
  post '/login' => "users#login"
  get '/login' => "users#login_form"
  post '/logout' => "users#logout"
  get 'users/index' => "users#index"
  post 'users/create' => "users#create"
  get 'users/:id/edit' => "users#edit"
  post 'users/:id/update' => "users#update"
  post 'users/:id/destroy' => "users#destroy"
  get 'users/:id' => "users#show"
  #postアクション
  get "/post/new" => "post#new"
  post "/post/create" => "post#create"
  get "/post/index" => "post#index"
  post "/post/:id/destroy" =>"post#destroy"
  get "/post/:id/edit" => "post#edit"
  post "/post/:id/update" => "post#update"
  get "/post/:id" => "post#show"
  #homeアクション
  get '/' => "home#top"
  get '/about' => "home#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
