Rails.application.routes.draw do
  resources :process_steps do
    resources :parameters
    collection do
      get :frontend
    end
  end
end
