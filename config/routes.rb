Rails.application.routes.draw do
  scope "api" do
    resources :accounts, defaults: { format: 'json' }
    resources :transactions, defaults: { format: 'json' }
  end

  root 'pages#index'
  get '/api/currencies', to: 'currencies#index'
  get '/accounts/:id', to: 'pages#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
