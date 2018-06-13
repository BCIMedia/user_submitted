Rails.application.routes.draw do
  scope :admin do
    namespace :user_submitted do
      root to: "pages#home"
      resources :collections do
        resources :contents
      end
    end
  end
end
