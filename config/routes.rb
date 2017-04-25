Rails.application.routes.draw do
  root 'groups#index'
  delete '/logout' => 'sessions#destroy', as: :logout
  delete '/groups/:id' => 'groups#delete_message'
  
  resources :users
  resources :sessions, only: [:new, :create]
  resources :groups do
    resources :messages
  end

  # post '/messages' => 'groups#new_message'
  # get '/groups/:id/edit' => 'groups#edit', as: :edit_blurb
  # patch '/groups/:id' => 'groups#update'
end

# Prefix Verb   URI Pattern                                   Controller#Action
#   root GET    /                                             groups#index
# logout DELETE /logout(.:format)                             sessions#destroy
#  users GET    /users(.:format)                              users#index
#        POST   /users(.:format)                              users#create
# new_user GET    /users/new(.:format)                          users#new
# edit_user GET    /users/:id/edit(.:format)                     users#edit
#   user GET    /users/:id(.:format)                          users#show
#        PATCH  /users/:id(.:format)                          users#update
#        PUT    /users/:id(.:format)                          users#update
#        DELETE /users/:id(.:format)                          users#destroy

# sessions POST   /sessions(.:format)                           sessions#create
# new_session GET    /sessions/new(.:format)                       sessions#new

# group_messages GET    /groups/:group_id/messages(.:format)          messages#index
#        POST   /groups/:group_id/messages(.:format)          messages#create
# new_group_message GET    /groups/:group_id/messages/new(.:format)      messages#new
# edit_group_message GET    /groups/:group_id/messages/:id/edit(.:format) messages#edit
# group_message GET    /groups/:group_id/messages/:id(.:format)      messages#show
#        PATCH  /groups/:group_id/messages/:id(.:format)      messages#update
#        PUT    /groups/:group_id/messages/:id(.:format)      messages#update
#        DELETE /groups/:group_id/messages/:id(.:format)      messages#destroy

# groups GET    /groups(.:format)                             groups#index
#        POST   /groups(.:format)                             groups#create
# new_group GET    /groups/new(.:format)                         groups#new
# edit_group GET    /groups/:id/edit(.:format)                    groups#edit
#  group GET    /groups/:id(.:format)                         groups#show
#        PATCH  /groups/:id(.:format)                         groups#update
#        PUT    /groups/:id(.:format)                         groups#update
#        DELETE /groups/:id(.:format)                         groups#destroy

# messages POST   /messages(.:format)                           groups#new_message
