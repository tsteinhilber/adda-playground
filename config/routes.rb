Rails.application.routes.draw do

  resources :legals
  get 'dashboard', to: 'dashboard#index'
  get 'fetch_contacts' => 'dashboard#contact_search', as: 'fetch_contacts'
  get 'fetch_artists' => 'dashboard#artist_search', as: 'fetch_artists'
  get 'fetch_jobs' => 'dashboard#job_search', as: 'fetch_jobs'
  get 'teams/add_member/', to: 'teams#add_member'

  devise_for :users, controllers: { passwords: "users/passwords", registrations: "users/registrations", sessions: "users/sessions" }

  namespace :api do
    namespace :v1 do
      resources :artists
      resources :clients
    end
  end

  resources :artists
  resources :clients do
    resources :contacts
  end
  resources :contacts
  resources :jobs

  resources :companies
  resources :teams do
    resources :memberships
  end

  resources :value_lists do
    resources :value_items
  end
  resources :vendors

  root 'dashboard#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
