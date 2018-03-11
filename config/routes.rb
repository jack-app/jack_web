Rails.application.routes.draw do
  get 'member_products/new'

  get 'member_products/edit'

  root 'static_pages#index'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'

  get 'welcome', to: 'static_pages#welcome'
  get 'meidaisai', to: 'static_pages#meidaisai'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :members
  resources :skills
  resources :sns_links
  resources :products
  resources :product_links
  resources :member_products
  resources :entries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
