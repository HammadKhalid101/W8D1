# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                     users GET    /users(.:format)                                                                         users#index
#                           POST   /users(.:format)                                                                         users#create
#                  new_user GET    /users/new(.:format)                                                                     users#new
#                 edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#                      user GET    /users/:id(.:format)                                                                     users#show
#                           PATCH  /users/:id(.:format)                                                                     users#update
#                           PUT    /users/:id(.:format)                                                                     users#update
#                           DELETE /users/:id(.:format)                                                                     users#destroy
#               new_session GET    /session/new(.:format)                                                                   sessions#new
#              edit_session GET    /session/edit(.:format)                                                                  sessions#edit
#                   session GET    /session(.:format)                                                                       sessions#show
#                           PATCH  /session(.:format)                                                                       sessions#update
#                           PUT    /session(.:format)                                                                       sessions#update
#                           DELETE /session(.:format)                                                                       sessions#destroy
#                           POST   /session(.:format)                                                                       sessions#create
#                 sub_posts POST   /subs/:sub_id/posts(.:format)                                                            posts#create
#              new_sub_post GET    /subs/:sub_id/posts/new(.:format)                                                        posts#new
#                      subs GET    /subs(.:format)                                                                          subs#index
#                           POST   /subs(.:format)                                                                          subs#create
#                   new_sub GET    /subs/new(.:format)                                                                      subs#new
#                  edit_sub GET    /subs/:id/edit(.:format)                                                                 subs#edit
#                       sub GET    /subs/:id(.:format)                                                                      subs#show
#                           PATCH  /subs/:id(.:format)                                                                      subs#update
#                           PUT    /subs/:id(.:format)                                                                      subs#update
#                           DELETE /subs/:id(.:format)                                                                      subs#destroy
#                  new_post GET    /posts/new(.:format)                                                                     posts#new
#                 edit_post GET    /posts/:id/edit(.:format)                                                                posts#edit
#                      post GET    /posts/:id(.:format)                                                                     posts#show
#                           PATCH  /posts/:id(.:format)                                                                     posts#update
#                           PUT    /posts/:id(.:format)                                                                     posts#update
#                           DELETE /posts/:id(.:format)                                                                     posts#destroy
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get “/subs/:title”, to: “subs#show”
  resources :users 
  resource :session
  resources :subs do
    resources :posts, only:[:new, :create]
  end
  resources :posts, except:[ :new, :index, :create]
end
