Rails.application.routes.draw do
  root 'messages#new'
  resources :messages, only: %i[ create ]
  get '/success', to: 'messages#success'
  get '/view_message', to: 'messages#view_message'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
