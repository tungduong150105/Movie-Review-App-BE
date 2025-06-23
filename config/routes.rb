Rails.application.routes.draw do
  # action cable server
  mount ActionCable.server => '/cable'

  post '/user/signup', to: 'users#create'
  post '/user/login', to: 'auth#login'

  post '/user/request_reset_password', to: 'passwordreset#create'
  post '/user/check_reset_token', to: 'passwordreset#check'
  patch '/user/update_password', to: 'passwordreset#update'

  get 'watchlist', to: 'watchlist#count'
  get '/watchlist/list', to: 'watchlist#list'
  post '/watchlist/add', to: 'watchlist#create'
  delete '/watchlist/delete', to: 'watchlist#delete'
  post 'watchlist/is_in_watchlist', to: 'watchlist#is_in_watchlist'

  post '/forum/add', to: 'forums#create'

  post '/message/add', to: 'messages#create'
  post '/message/find', to: 'messages#find'

  get 'rating/get', to: 'rating#get'
  get 'rating/list', to: 'rating#list'
  post 'rating/add', to: 'rating#create'
  put 'rating/update', to: 'rating#update'

  get 'recent/list', to: 'recent#list'
  post 'recent/add', to: 'recent#create'

  post 'comment/get', to: 'comment#get'
  post 'comment/add', to: 'comment#create'

  get 'person/get', to: 'person#get'
  post 'person/add', to: 'person#create'
  delete 'person/delete', to: 'person#delete'
  post 'person/is_in_favorite', to: 'person#is_in_favorite'

  post 'movieinfo/add', to: 'movieinfo#create'
  post 'movieinfo/find', to: 'movieinfo#find'
end
