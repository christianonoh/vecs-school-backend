Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'current_user/', to: 'current_user#index'
      resources :users, only: [:index]
      resources :courses
      resources :reservations
    end
  end

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end