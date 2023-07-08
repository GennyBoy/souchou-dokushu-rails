Rails.application.routes.draw do
  get '/', to: 'rooms#index'
  get 'top/index'
  resources :rooms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
