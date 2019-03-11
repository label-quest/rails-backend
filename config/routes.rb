Rails.application.routes.draw do
  resources :labels
  resources :users
  resources :dataset_classes
  resources :images
  resources :datasets
  resources :customers

  get 'datasets/:id/label_stats', :to => 'datasets#label_stats'
  get 'datasets/:id/progress', :to => 'datasets#progress'

  get 'customers/:id/overall_stats', :to => 'customers#overall_stats'

  post 'customer_authenticate', :to => 'customers#authenticate'

end
