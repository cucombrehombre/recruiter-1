Recruiter::Application.routes.draw do
  resources :experiments
  resources :sessions

  if Rails.env.development?
    mount MailPreview => 'mail_view'
  end

  # user accounts and profiles
  devise_for :users

  resource :profile

  # static page overrides for CMS
  get 'help',      to: 'pages#help'
  get 'dashboard', to: 'pages#dashboard'

  # light CMS
  # http://railscasts.com/episodes/117-semi-static-pages-revised
  # WARNING: order is crucial, do not rearrange #
  get ':id', to: 'pages#show', as: :page        #
  resources :pages, except: [:index, :show]     #
  root to: 'pages#index'                        #
end
