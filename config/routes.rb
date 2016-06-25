Rails.application.routes.draw do
  resources :competitions,
            defaults: { format: :json },
            only: %i(create update show destroy)
end
