Rails.application.routes.draw do
  resources :labels
  resources :users
  resources :dataset_classes
  resources :images
  resources :datasets
  resources :customers

  get 'datasets/:id/label_stats', :to => 'datasets#label_stats'

end
