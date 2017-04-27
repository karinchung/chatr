Rails.application.routes.draw do
  root 'groups#index'
  delete '/logout' => 'sessions#destroy', as: :logout

  resources :users
  resources :sessions, only: [:new, :create]
  resources :groups do
    resources :messages
    resources :invites
  end


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

# group_invites GET    /groups/:group_id/invites(.:format)           invites#index
#        POST   /groups/:group_id/invites(.:format)           invites#create
# new_group_invite GET    /groups/:group_id/invites/new(.:format)       invites#new
# edit_group_invite GET    /groups/:group_id/invites/:id/edit(.:format)  invites#edit
# group_invite GET    /groups/:group_id/invites/:id(.:format)       invites#show
#        PATCH  /groups/:group_id/invites/:id(.:format)       invites#update
#        PUT    /groups/:group_id/invites/:id(.:format)       invites#update
#        DELETE /groups/:group_id/invites/:id(.:format)       invites#destroy

# groups GET    /groups(.:format)                             groups#index
#        POST   /groups(.:format)                             groups#create
# new_group GET    /groups/new(.:format)                         groups#new
# edit_group GET    /groups/:id/edit(.:format)                    groups#edit
#  group GET    /groups/:id(.:format)                         groups#show
#        PATCH  /groups/:id(.:format)                         groups#update
#        PUT    /groups/:id(.:format)                         groups#update
#        DELETE /groups/:id(.:format)                         groups#destroy
