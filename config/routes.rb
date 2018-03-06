Rails.application.routes.draw do
  root 'static_pages#index'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'

  get 'welcome', to: 'static_pages#welcome'
  get 'meidaisai', to: 'static_pages#meidaisai'

  resources :members
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
