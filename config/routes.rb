Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :missions
    end
  end
end
