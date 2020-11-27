Rails.application.routes.draw do
  root 'stores#index'
  
  get 'stores', to: 'stores#index'
  get 'stores/:id', to: 'stores#show', as: :store

  get 'financial_transactions', to: 'financial_transactions#index'
  post 'financial_transactions', to: 'financial_transactions#create'
end
