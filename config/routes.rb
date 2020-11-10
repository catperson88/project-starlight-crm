Rails.application.routes.draw do
  root 'homes#splash'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
      resource :deals, only: [:show]
  end

   resources :accounts, only: [:index, :show, :new, :create, :delete] do
    resources :companies, only: [:index, :show, :new, :create, :delete]
   end

   resources :companies, only: [:index, :show, :new, :create, :delete] do 
    resources :deals, only: [:index, :show, :new, :create, :delete]
    resources :contacts, only: [:index, :show, :new, :create, :delete] 
    resource :activities, only: [:index, :show, :new, :create, :delete] 
   end

   resources :contacts, only: [:index, :show, :new, :create, :delete] do 
    resource :activities, only: [:index, :show, :new, :create, :delete]
   end

   resources :deals, only: [:index, :show, :new, :create, :delete] do 
    resources :companies, only: [:index, :show, :new, :create, :delete]
    resource :activities, only: [:index, :show, :new, :create, :delete]
   end

   resources :products, only: [:index, :show, :new, :create, :delete]

   
end
