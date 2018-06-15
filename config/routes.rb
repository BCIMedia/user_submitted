Rails.application.routes.draw do
  scope :admin do
    namespace :user_submitted do
      root to: "pages#home"
      resources :collections do
        resources :contents do
          post "update_status", to: "contents#update_status", as: :update_status
        end
      end
    end
  end
  namespace :user_submitted do
    get "collections/:id/contents/new",     to: "pages#new",    as: :new_content
    post "collections/:id/contents/create", to: "pages#create", as: :create_content
    # TODO can users view their conent? Email to lookup and PIN to change?
    # get "contents/index/:email",         to: "pages#index"
    # get "contents/:id/:email",           to: "pages#show"
  end
end
