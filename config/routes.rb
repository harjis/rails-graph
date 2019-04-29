Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'graphs/:id/undo', to: 'graphs#undo'
  resources :graphs do
    resources :nodes
    resources :edges
  end
end
