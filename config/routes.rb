Rails.application.routes.draw do
  resources :jobs, only: [:index, :new, :create, :destroy, :update] do
      collection do
        get 'myjobs'
      end
  end
  get "/jobs/:id", to: "jobs#claim"
  patch "/jobs/:id", to: "jobs#update"

  root 'home#index'
  devise_for :users, :controllers => { registrations: 'users/registrations' } 

end
