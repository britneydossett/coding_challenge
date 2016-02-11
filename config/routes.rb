Rails.application.routes.draw do
  resources :sessions, only:[:new, :create, :destroy]

  # match '/customers', to: 'customers#new', via: 'get'
  # get "new_customer" => 'customers#new', :as => :new_customer
  match '/tasks/complete/:id' => 'tasks#complete', as: 'complete_task', via: :get
  match '/tasks/new' => 'tasks#new', as: 'new_task', via: :get

  resources :customers
  resources :tasks
  # match '/tasks/complete' => 'tasks#complete', as: 'complete_task'

  root to: 'customers#index'

end
