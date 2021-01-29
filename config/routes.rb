Rails.application.routes.draw do
  root to: "welcome#index"

  resource :cleaning, only: [:new, :create]
end
