Rails.application.routes.draw do
  post '/user/signup', to: 'users#create'
  post '/user/login', to: 'auth#login'

  post '/user/request_reset_password', to: 'passwordreset#create'
  post '/user/check_reset_token', to: 'passwordreset#check'
  patch '/user/update_password', to: 'passwordreset#update'
end
