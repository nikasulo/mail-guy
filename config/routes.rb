Rails.application.routes.draw do
  root 'messages#new'
  get '/success', to: 'messages#success'
  resources :messages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
