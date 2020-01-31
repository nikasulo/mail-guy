Rails.application.routes.draw do
  root 'messages#new'
  resources :messages
  get '/success', to: 'messages#success'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
