Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # post :create_study, to: 'studies#create'
  # #route mapping to controller#action
  # get :studies, to: 'studies#index'
  # patch 'update_study/:id', to: 'studies#update'
  # delete 'delete_study/:id', to: 'studies#destroy'
  
  resources :study_groups do
    resources :studies do 
      member do
        get :delete
      end
    end
    
    member do
      get :delete 
    end
  end

  get 'active_studies', to: 'studies#active'
end
