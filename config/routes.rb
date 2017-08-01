Rails.application.routes.draw do
  scope "api" do
    resources :accounts, defaults: { format: 'json' }
  end

  root 'pages#index'

  get '/accounts', to: 'accounts#index'

  get '/api/currencies', to: 'currencies#index'


  get '/accounts/new', to: 'pages#index'

  # match '*path', to: 'pages#index', via: [:get, :post]

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
