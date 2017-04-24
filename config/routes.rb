Rails.application.routes.draw do
  root 'users#new'
  delete '/logout' => 'sessions#destroy', as: :logout
  resources :users
  resources :sessions, only: [:new, :create]
  resources :messages
end

# Prefix Verb   URI Pattern               Controller#Action
#   root GET    /                         users#index
#  users GET    /users(.:format)          users#index
#        POST   /users(.:format)          users#create
# new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#   user GET    /users/:id(.:format)      users#show
#        PATCH  /users/:id(.:format)      users#update
#        PUT    /users/:id(.:format)      users#update
#        DELETE /users/:id(.:format)      users#destroy

# sessions POST   /sessions(.:format)          sessions#create
# new_session GET    /sessions/new(.:format)      sessions#new
#
# messages GET    /messages(.:format)          messages#index
#          POST   /messages(.:format)          messages#create
# new_message GET    /messages/new(.:format)      messages#new
# edit_message GET    /messages/:id/edit(.:format) messages#edit
#  message GET    /messages/:id(.:format)      messages#show
#          PATCH  /messages/:id(.:format)      messages#update
#          PUT    /messages/:id(.:format)      messages#update
#          DELETE /messages/:id(.:format)      messages#destroy
