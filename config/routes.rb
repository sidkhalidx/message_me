Rails.application.routes.draw do
  get 'messages/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'chatroom#index'
  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#login'
  delete 'logout', to: 'sessions#destroy', as: :logout
  post 'message', to: 'messages#create', as: :message_create


  # mount ActionCable.server, at: '/cable'
end
