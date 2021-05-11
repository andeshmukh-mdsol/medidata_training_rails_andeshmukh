Rails.application.routes.draw do
  
  get 'enrollments/index'
  get 'enrollments/new'
  get 'subjects/index'
  get 'subjects/new'
  root 'roots#index'
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

  resources :enrollments, except:['show','delete']

  resources :subjects, except:['show','delete']


  get 'active_studies', to: 'studies#active'
end
