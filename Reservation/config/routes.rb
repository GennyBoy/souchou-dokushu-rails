Rails.application.routes.draw do
  resources :users
  resources :orders
  root to: 'rooms#index'
  get 'top/index'
  resources :rooms do
    resources :entries, only: %i[new create destroy index], shallow: true
  end
  post 'entries/confirm'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
