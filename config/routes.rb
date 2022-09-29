Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :shorteners
    end
  end

  get '/:short_code', to: 'api/v1/shorteners#show'
end
