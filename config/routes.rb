Rails.application.routes.draw do
  resources :questions do
    resources :answers
  end
  resources :users
end
