Rails.application.routes.draw do
  resources :posts
  devise_for :admins, skip: :registrations
  get 'leads/csv_list'

  root 'home#index'

  resources :leads
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
