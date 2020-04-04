Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :tasks
  end
  #get 'front/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'front#index'
  get '/filter', to: 'front#filter'
  root 'front#index'
end
