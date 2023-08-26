Rails.application.routes.draw do
  get '/current_user', to: 'current_user#index'
  devise_for :users, path_names: {
    sign_in: 'login',
    sign_out: 'logout'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }


  delete "/movies/", to: "movies#destroy"
 
  resources :movies
end
