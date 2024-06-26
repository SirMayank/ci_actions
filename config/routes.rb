Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :transactions, only: [:create], path: 'transactions/single'
    end
  end
end
