Rails.application.routes.draw do
  resources :mailing_addresses, only: [:new, :create, :edit, :show]

  resources :obligations

  resources :templates do
    resource :mailing_address, module: :templates
  end

end
