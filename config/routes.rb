Rails.application.routes.draw do
  root to: "welcome#index"

  resource :cleaning, only: [:new, :create, :show]
  get '/cleaning_refresh/:id/:result_url', to: 'cleaning#refresh'

end
