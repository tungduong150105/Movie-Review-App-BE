Rails.application.routes.draw do
  post '/user/signup', to: 'users#create'
  post '/user/login', to: 'auth#login'
end
