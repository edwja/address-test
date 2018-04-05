Rails.application.routes.draw do
  resources :mailing_addresses, only: [:create, :update]

  resources :obligations

  resources :templates do
    resource :mailing_address, module: :templates
  end

end
