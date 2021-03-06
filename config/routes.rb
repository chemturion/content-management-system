Rails.application.routes.draw do

  # ROOT Route
  # match '/', to: 'public#index', via: :get #longhand MATCH-y form
  root to: 'public#index' # shorter sans MATCH
  # root 'public#index' # super-short-y

  get 'show/:permalink', to: 'public#show', as: 'public_show'

  ### ROUTES FOR ACCESS ###
  get 'admin', to: 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'
  ### END ACCESS ###

  ### RESOURCE ROUTES FOR ADMIN_USERS ###
  resources :admin_users, except: :show do
    member do
      get :delete
    end
  end
  ### END RESOURCE ROUTES ###

  ### RESOURCE ROUTES ###
  resources :subjects do
    member do
      get :delete
    end
  end
  resources :pages do
    member do
      get :delete
    end
  end
  resources :sections do
    member do
      get :delete
    end
  end
  ### END RESOURCE ROUTES ###

  ##### GENERATED ROUTES #####
  # get 'subjects/index'
  # get 'subjects/show'
  # get 'subjects/new'
  # get 'subjects/edit'
  # get 'subjects/delete'
  ### END GENERATED ROUTES ###

  # SIMPLE MATCH Route
  # get 'demo/index' # shorthand version
  match 'demo/index', to: 'demo#index', via: :get # longhand version

  # Match the url {{ site.url }}/demo/hello to the demo controller, hello method
  match 'demo/hello', to: 'demo#hello', via: :get

  # SIMPLE Route for matching demo#other_hello
  match 'demo/other_hello', to: 'demo#other_hello', via: :get

  # SIMPLE Route for matching demo#lynda
  match 'demo/lynda', to: 'demo#lynda', via: :get

  match 'demo/escape_output', to: 'demo#escape_output', via: :get

  # DEFAULT Route, parens indicate optional
  # may be deprecated in future Rails versions
  # get ':controller(/:action(/:id))'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
