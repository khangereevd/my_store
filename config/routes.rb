Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :items do
    get :upvote, on: :member
    get :expensive, on: :collection
  end

  get 'admin/users_count', to: 'admin#users_count'
  root 'items#index'
end