Rails.application.routes.draw do
  get("/", { to: "home#index" })
  get("/glossary", { to: "home#glossary" })
  root({ to: "home#index" })

  resources(:missions) do
    member do
      put("order_deliverables")
    end

    resources(:deliverables) do
      member do
        put("order_requirements")
      end

      resources(:requirements)
    end
  end

  namespace :api do
    namespace :v1 do
      resources :missions
    end
  end
end
