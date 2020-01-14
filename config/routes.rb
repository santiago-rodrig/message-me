Rails.application.routes.draw do
  get 'chatroom', to: 'chat_room#index'
  post '/', to: 'sessions#create'
  post 'message', to: 'messages#create'
  delete 'logout', to: 'sessions#destroy'
  root 'sessions#new'
end
