Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :private do
      namespace :v1 do
        resources :fx_transactions, only: %i[index show create]
      end
    end
  end

end
