Rails.application.routes.draw do
  get("/", { to: "home#index" })

  resources(:missions) do
    resources(:deliverables)
  end

  namespace :api do
    namespace :v1 do
      resources :missions
    end
  end
end
