Rails.application.routes.draw do
  # action cable server
  mount ActionCable.server => '/cable'

  post '/user/signup', to: 'users#create'
  post '/user/login', to: 'auth#login'

  post '/user/request_reset_password', to: 'passwordreset#create'
  post '/user/check_reset_token', to: 'passwordreset#check'
  patch '/user/update_password', to: 'passwordreset#update'

  post '/watchlist/add', to: 'watchlists#create'
  get '/watchlist/list', to: 'watchlists#list'

  post '/forum/add', to: 'forums#create'

  post '/message/add', to: 'messages#create'
  post '/message/find', to: 'messages#find'
end
