Rails.application.routes.draw do
  resources :profil
  # register
  get '/users/register', to: 'auth#form_register', as: 'form_register'
  post '/users/register', to: 'auth#register', as: 'register_post'

  # login
  get '/login', to: 'auth#form_login', as: 'form_login'
  post '/login', to: 'auth#login', as: 'login_post'

  # logout
  delete '/logout/:id', to: 'auth#logout', as: 'user_logout'
end
