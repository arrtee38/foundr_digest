Rails.application.routes.draw do
  root 'pages#home'
  get 'apply', to: 'pages#apply', as: 'apply'
  get 'thanks', to: 'pages#thanks', as: 'thanks'
  get 'start', to: 'pages#start', as: 'start'
  get 'magic_login', to: 'pages#magic_login', as: 'magic_login'

  devise_for :users
  get 'logout', to: 'pages#logout', as: 'logout'
  get 'login', to: redirect(path: '/users/sign_in')

  resources :subscribe, only: [:index]
  get 'dashboard', to: 'dashboard#index'

  # get 'stakeholder_updates/new', to: 'stakeholder_updates#new'
  resources :stakeholder_updates, only: %i[new create edit show update]
  resources :updates, only: [:show]

  resources :account, only: %i[index update]
  resources :billing_portal, only: [:create]
  match '/billing_portal' => 'billing_portal#create', via: [:get]
  match '/cancel' => 'billing_portal#destroy', via: [:get]

  resources :user_submissions, only: [:create]
  resources :projects, only: [:update]
  resources :subscribers, only: %i[create destroy]

  # static pages
  pages = %w[
    privacy terms
  ]

  pages.each do |page|
    get "/#{page}", to: "pages##{page}", as: "#{page.gsub('-', '_')}"
  end

  # admin panels
  authenticated :user, -> user { user.admin? } do
    namespace :admin do
      get '/', to: 'pages#dashboard'
      resources :user_submissions, only: [:update]
    end
  end
end
