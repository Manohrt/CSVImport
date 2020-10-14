Rails.application.routes.draw do

  resources :questions do
   collection { post :import}
  end

  root to: 'questions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
