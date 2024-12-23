Rails.application.routes.draw do
  root "pages#home"

  # Юзеры
  resources :users, only: [ :new, :create, :show, :edit, :update ]

  # Аутентификация
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy", as: "logout"

  # Группы
  get "/groups/new", to: "groups#new", as: "new_group"
  post "/groups", to: "groups#create", as: "groups"
  get "/groups/join", to: "groups#join", as: "join_group_form"
  post "/groups/join", to: "groups#join", as: "join_group"
  get "/groups/:id", to: "groups#show", as: "group"
  get "/groups/:id/settings", to: "groups#settings", as: "group_settings"
  post "/groups/:id/start_distribution", to: "groups#start_distribution", as: "start_distribution_group"
  get "/groups/:id/edit", to: "groups#edit", as: "edit_group"
  patch "/groups/:id", to: "groups#update", as: "update_group"
  delete "/groups/:id", to: "groups#destroy"

  # Дашборд
  get "/dashboard", to: "dashboard#index"
end
