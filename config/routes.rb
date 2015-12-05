Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :loans do
      resources :loan_payments
    end
  end
end
