Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :accounts, only: [:index, :show, :new, :create, :delete] do
    resources :companies, only: [:index, :show, :new, :create, :delete]
   end

   resources :companies, only: [:index, :show, :new, :create, :delete]

   resources :contacts, only: [:index, :show, :new, :create, :delete]

   resources :deals, only: [:index, :show, :new, :create, :delete]

   resources :products, only: [:index, :show, :new, :create, :delete]
end
