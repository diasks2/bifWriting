BifWriting::Application.routes.draw do
  resources :passages
  root to: 'static_pages#home'
end
