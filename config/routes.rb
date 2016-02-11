Rails.application.routes.draw do
  match '/customers/:id' => 'tasks#create', as: 'create_task', via: :post
  # get "new_task" => 'tasks#create', :as => :new_task
  match '/tasks/complete/:id' => 'tasks#complete', as: 'complete_task', via: :get
  # match '/tasks/new' => 'tasks#new', as: 'new_task', via: :get

  resources :customers
  resources :tasks

  root to: 'customers#index'

end
