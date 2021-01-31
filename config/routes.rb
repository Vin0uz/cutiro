Rails.application.routes.draw do
  root to: "welcome#index"

  resource :cleaning, only: [:new, :create, :show]
  get '/cleaning/refresh/:id', to: 'cleanings#refresh'

end
