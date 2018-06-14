Rails.application.routes.draw do
  scope :admin do
    namespace :user_submitted do
      root to: "pages#home"
      resources :collections do
        resources :contents
      end
    end
  end
  namespace :user_submitted do
    get "collections/:id/contents/new",     to: "pages#new",    as: :new_content
    post "collections/:id/contents/create", to: "pages#create", as: :create_content
  end
  # TODO can users view their conent? Email to lookup and PIN to change?
  # get "user_submitted/contents/index/:email",         to: "pages#index"
  # get "user_submitted/contents/:id/:email",           to: "pages#show"
end
