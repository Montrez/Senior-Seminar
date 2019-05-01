Rails.application.routes.draw do
  get 'search', to: 'home#search'

  resources :expense_reports
  resources :actual_expenses
  resources :estimated_expenses
  resources :requests
  namespace :admin do
      resources :accounts
      resources :admin_accounts
      resources :approvers
      resources :submitters
      resources :managers
      resources :requests
      resources :actual_expenses
      resources :estimated_expenses
      resources :trips
      root to: "accounts#index"
    end
  resources :trips
  root 'home#index', as: 'home_index'
  get 'home/index'
  get 'home/data'

  devise_for :accounts,  :controllers => { :registrations => 'registrations' }
  resources :submitters, only: [:edit, :update]
  resources :approvers, only: [:edit, :update]

  resources :submitters, only: [:edit, :update]
  resources :approvers, only: [:edit, :update]
  resources :managers, only: [:edit, :update]

  #approve status in views via the approve action
  resources :estimated_expenses do
    member do
      put :approve
    end
  end

  resources :actual_expenses do
    member do
      put :approve
    end
  end

  resources :trips do
    member do
      put :approve
      get :portal
    end
  end

  resources :requests do
    member do
      put :approve
    end
  end

  resources :expense_reports do
    member do
      put :approve
      get :portal
    end
  end



  #approve status in views via the approve action
  resources :estimated_expenses do
    member do
      put :disapprove
    end
  end

  resources :actual_expenses do
    member do
      put :disapprove
    end
  end

  resources :trips do
    member do
      put :disapprove
    end
  end

  resources :requests do
    member do
      put :disapprove
    end
  end

  resources :expense_reports do
    member do
      put :disapprove
    end
  end

end
