Rails.application.routes.draw do
  devise_for :admins, skip: :registrations

  root 'home#index'

  resources :leads
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
