Rails.application.routes.draw do
  get 'chatroom', to: 'chat_room#index'
  post '/', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  root 'sessions#new'
end
