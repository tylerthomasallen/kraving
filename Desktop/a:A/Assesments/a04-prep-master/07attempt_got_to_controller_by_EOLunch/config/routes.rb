Rails.application.routes.draw do





  get 'comments/create'

  get 'comments/destroy'

  resources :users, only:[:new, :create]
  resource :session, only:[:new, :create, :destroy]
  resources :comments, only:[:destroy]

  resources :links do
    resources :comments, only:[:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
