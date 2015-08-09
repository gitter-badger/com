Rails.application.routes.draw do
  resources(:deliverables)
  resources(:missions)

  namespace :api do
    namespace :v1 do
      resources :missions
    end
  end
end
