Rails.application.routes.draw do
  get "invitations/new"
  root "pages#home"

  # Стандартные маршруты для пользователей
  resources :users, only: [ :new, :create, :show, :edit, :update ]

  # Страницы для аутентификации
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy", as: "logout"

  # Группы
  get "/groups/new", to: "groups#new", as: "new_group"
  post "/groups", to: "groups#create", as: "groups"
  get "/groups/join", to: "groups#join", as: "join_group"
  get "/groups/:id", to: "groups#show", as: "group"
  get "/groups/:id/settings", to: "groups#settings", as: "group_settings"
  post "/groups/:id/start_distribution", to: "groups#start_distribution", as: "start_distribution_group"

  # Страницы для приглашений
  get "/groups/:group_id/invitations/new", to: "invitations#new", as: "new_invitation_link"

  # Дашборд
  get "/dashboard", to: "dashboard#index"
end
