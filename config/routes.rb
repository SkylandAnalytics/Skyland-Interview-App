Rails.application.routes.draw do
  resources :process_steps do
    resources :parameters do
    end

    collection do
      get :frontend
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
